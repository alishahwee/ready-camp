import React, { useState, useEffect } from "react";
import { withRouter } from "react-router-dom";
import tw from "twin.macro";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronRight } from "@fortawesome/free-solid-svg-icons";

const Form = tw.form`flex items-center w-full mb-2`;
const Input = tw.input`container h-12 rounded-md p-4 mr-2 w-60 sm:w-full`;

const SearchBar = ({ history }) => {
  const [park, setPark] = useState({ id: undefined, name: "" });
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
      history.push(`/park/${park.id}`);
      history.go();
    }
  };

  const handleChange = (e) => {
    let parkId = undefined;
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
    <Form onSubmit={handleSubmit}>
      <Input
        list="parks"
        type="search"
        placeholder="Search"
        autoComplete="off"
        name="name"
        value={park.name}
        onChange={handleChange}
      />
      <datalist id="parks">{dataOptions}</datalist>
      <button tw="rounded-full bg-dark-lava hover:bg-yellow-900 w-10 h-10 flex-none">
        <FontAwesomeIcon tw="text-white" icon={faChevronRight} />
      </button>
    </Form>
  );
};

export default withRouter(SearchBar);
