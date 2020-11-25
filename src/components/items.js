import React, { useState, useEffect } from "react";
import axios from "axios";
import tw from "twin.macro";
import { useAuth } from "../hooks/auth";
const Wrapper = tw.div``;

const Items = ({ parkId }) => {
  const auth = useAuth();
  const [categories, setCategories] = useState({});
  const [checkedItems, setCheckedItems] = useState(null);

  useEffect(() => {
    axios
      .get("/api/items")
      .then((res) => {
        setCategories(res.data);
      })
      .catch((err) => console.log(err));
  }, []);

  useEffect(() => {
    if (auth.token) getCheckedItems();
  }, []);

  const getCheckedItems = () => {
    axios
      .get("/api/checked", {
        params: {
          park_id: parkId,
        },
        headers: {
          Authorization: "Bearer " + auth.token,
        },
      })
      .then((res) => setCheckedItems(res.data))
      .catch(
        (err) =>
          err.response.status === 401 &&
          auth.setToken(null) /* Silently log user out. */
      );
  };

  const updateUserItemDb = (e) => {
    auth.token &&
      (e.target.checked ? checkItem(e.target.id) : uncheckItem(e.target.id));
  };

  const checkItem = (eId) => {
    const itemId = eId.split("-")[1];
    axios({
      method: "POST",
      url: `/api/${parkId}/check`,
      data: {
        item_id: itemId,
      },
      headers: {
        Authorization: "Bearer " + auth.token,
      },
    })
      .then((res) => {
        if (res.data.status === "success") {
          getCheckedItems();
          console.log(res.data.message);
        }
      })
      .catch(
        (err) =>
          err.response.status === 401 &&
          auth.setToken(null) /* Silently log user out. */
      );
  };

  const uncheckItem = (eId) => {
    const itemId = eId.split("-")[1];
    axios({
      method: "DELETE",
      url: `/api/${parkId}/uncheck`,
      data: {
        item_id: itemId,
      },
      headers: {
        Authorization: "Bearer " + auth.token,
      },
    })
      .then((res) => {
        if (res.data.status === "success") {
          getCheckedItems();
          console.log(res.data.message);
        }
      })
      .catch(
        (err) =>
          err.response.status === 401 &&
          auth.setToken(null) /* Silently log user out. */
      );
  };

  return checkedItems
    ? Object.keys(categories).map((category) => (
        <Wrapper key={`item-wrapper-${category}`}>
          <p key={`category-${category}`}>{category}</p>
          {Object.values(categories[category]).map((item) => {
            const shouldCheck = () => {
              for (const checkedItem of checkedItems) {
                if (checkedItem.id == item.id) {
                  return true;
                }
              }
              return false;
            };

            return (
              <div key={`item-input-group-${item.id}`}>
                <input
                  type="checkbox"
                  id={`item-${item.id}`}
                  key={`checkbox-${item.id}`}
                  onChange={updateUserItemDb}
                  defaultChecked={shouldCheck()}
                />
                <label htmlFor={`item-${item.id}`} key={`label-${item.id}`}>
                  {item.name}
                </label>
              </div>
            );
          })}
        </Wrapper>
      ))
    : auth.token ||
        Object.keys(categories).map((category) => (
          <Wrapper key={`item-wrapper-${category}`}>
            <p key={`category-${category}`}>{category}</p>
            {Object.values(categories[category]).map((item) => (
              <div key={`item-input-group-${item.id}`}>
                <input
                  type="checkbox"
                  id={`item-${item.id}`}
                  key={`checkbox-${item.id}`}
                  onChange={updateUserItemDb}
                />
                <label htmlFor={`item-${item.id}`} key={`label-${item.id}`}>
                  {item.name}
                </label>
              </div>
            ))}
          </Wrapper>
        ));
};

export default Items;
