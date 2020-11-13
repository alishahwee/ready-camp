import React, { useState, useEffect } from "react";
import { withRouter, useHistory } from "react-router-dom";
import tw from "twin.macro";

const Form = tw.form`w-full max-w-sm`;
const Input = tw.input`container mx-auto`;

const SearchBar = () => {
  const history = useHistory();

  const [park, setPark] = useState({ id: undefined, name: ""});
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
    </Form>
  );
};

export default withRouter(SearchBar);
