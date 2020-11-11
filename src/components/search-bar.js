import React, { useState, useEffect } from "react";
import { Redirect } from "react-router-dom";
import tw from "twin.macro";

const SearchBar = () => {
  const [park, setPark] = useState({ id: "", name: "" });
  const [parks, setParks] = useState([]);

  useEffect(() => {
    fetch("/api/parks")
      .then((res) => res.json())
      .then((data) => setParks(data))
      .catch((err) => console.log(err));
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (park.id) {
      return <Redirect to={`/park/${park.id}`} />;
    } else {
      fetch(`/api/search?name=${park.name}`)
        .then((res) => res.json())
        .then((data) => console.log(data));
      return (
        <Redirect
          to={{
            pathname: "/search",
            search: `?name=${park.name}`,
            state: { referrer: currentLocation },
          }}
        />
      );
    }
  };

  const handleChange = (e) => {
    let parkId = "";
    for (const park of parks) {
      if (e.target.value === park.name) {
        parkId = park.id;
      }
    }
    setPark({ id: parkId, [e.target.name]: e.target.value });
  };

  const dataOptions = parks.map((park) => (
    <option key={park.id} value={park.name} />
  ));

  return (
    <form onSubmit={handleSubmit}>
      <input
        list="parks"
        type="search"
        placeholder="Search"
        autoComplete="off"
        name="name"
        value={park.name}
        onChange={handleChange}
      />
      <datalist id="parks">{dataOptions}</datalist>
    </form>
  );
};

export default SearchBar;
