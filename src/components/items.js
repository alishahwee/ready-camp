import React, { useState, useEffect } from "react";
import axios from "axios";
import tw from "twin.macro";
import { useAuth } from "../hooks/auth";

const Wrapper = tw.div``;

const Items = ({ parkId }) => {
  const auth = useAuth();
  const [categories, setCategories] = useState({});

  useEffect(() => {
    axios
      .get("/api/items")
      .then((res) => {
        setCategories(res.data);
      })
      .catch((err) => console.log(err));
  }, []);

  const updateUserItemDb = (e) => {
    e.target.checked ? checkItem(e.target.id) : uncheckItem(e.target.id);
  };

  const checkItem = (eId) => {
    const itemId = eId.split("-")[1]
    axios({
      method: "POST",
      url: `/api/${parkId}/check`,
      data: {
        "item_id": itemId
      },
      headers: {
        Authorization: "Bearer " + auth.token,
      },
    }).then((res) => {
      if (res.data.status === "success") {
        // TODO: Fetch and update item state.
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
    const itemId = eId.split("-")[1]
    axios({
      method: "DELETE",
      url: `/api/${parkId}/uncheck`,
      data: {
        "item_id": itemId
      },
      headers: {
        Authorization: "Bearer " + auth.token,
      },
    }).then((res) => {
      if (res.data.status === "success") {
        // TODO: Fetch and update item state.
        console.log(res.data.message);
      }
    })
    .catch(
      (err) =>
        err.response.status === 401 &&
        auth.setToken(null) /* Silently log user out. */
    );
  };

  return Object.keys(categories).map((category) => (
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
