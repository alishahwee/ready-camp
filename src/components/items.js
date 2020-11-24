import React, { useState, useEffect } from "react";
import axios from "axios";
import tw from "twin.macro";

const Wrapper = tw.div``;

const Items = () => {
  const [categories, setCategories] = useState({});

  useEffect(() => {
    axios
      .get("/api/items")
      .then((res) => {
        setCategories(res.data);
      })
      .catch((err) => console.log(err));
  }, []);

  return Object.keys(categories).map((category) => (
    <Wrapper key={`item-wrapper-${category}`}>
      <p key={`category-${category}`}>{category}</p>
      {Object.values(categories[category]).map((item) => (
        <div key={`item-input-group-${item.id}`}>
          <input
            type="checkbox"
            id={`item-${item.id}`}
            key={`checkbox-${item.id}`}
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
