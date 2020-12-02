import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import tw from "twin.macro";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faMinus } from "@fortawesome/free-solid-svg-icons";
import { useAuth } from "../hooks/auth";

const Wrapper = tw.div`mb-3 py-2 px-3 last:mb-0 bg-white rounded`;
const H2 = tw.h2`mb-1 text-dark-lava text-xl font-medium w-full`;
const H3 = tw.h3`w-full`;
const Label = tw.label`ml-2 text-sm text-gray-700`;
export const LoginMsg = tw.p`text-green-500 text-xs italic mb-1`;
const InputGrp = tw.div`mb-1 w-full sm:w-1/2 lg:w-1/3`;

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

  return (
    <div tw="p-2">
      <H2>Camping Checklist</H2>
      {auth.token ? null : (
        <Link to="/login">
          <LoginMsg>Log in first to save your checkmarks!</LoginMsg>
        </Link>
      )}
      <div>
        {Object.keys(categories).map((category) => (
          <ItemGrp
            key={`item-group-${category}`}
            category={category}
            items={categories[category]}
            checkedItems={checkedItems}
            updateUserItemDb={updateUserItemDb}
          />
        ))}
      </div>
    </div>
  );
};

const ItemGrp = ({ category, items, checkedItems, updateUserItemDb }) => {
  const [showItems, setShowItems] = useState(false);

  const toggleItems = () => setShowItems(!showItems);
  const shouldCheck = (item) => {
    for (const checkedItem of checkedItems) {
      if (checkedItem.id == item.id) {
        return true;
      }
    }
    return false;
  };

  return (
    <Wrapper>
      <div
        tw="flex justify-between items-center cursor-pointer"
        onClick={toggleItems}
      >
        <H3 key={`category-${category}`}>{category}</H3>
        {showItems ? (
          <FontAwesomeIcon icon={faMinus} />
        ) : (
          <FontAwesomeIcon icon={faPlus} />
        )}
      </div>
      <div
        tw="flex flex-wrap w-full mt-2"
        css={{ display: showItems ? "flex;" : "none;" }}
      >
        {items.map((item) => (
          <InputGrp key={`item-input-group-${item.id}`}>
            <input
              type="checkbox"
              id={`item-${item.id}`}
              key={`checkbox-${item.id}`}
              onChange={updateUserItemDb}
              defaultChecked={checkedItems && shouldCheck(item)}
            />
            <Label htmlFor={`item-${item.id}`} key={`label-${item.id}`}>
              {item.name}
            </Label>
          </InputGrp>
        ))}
      </div>
    </Wrapper>
  );
};

export default Items;
