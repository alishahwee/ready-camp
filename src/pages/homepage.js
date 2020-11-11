import React, { useState } from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import SearchBar from "../components/search-bar";

const Homepage = () => (
  <>
    <Helmet>
      <title>Homepage</title>
    </Helmet>
    <SearchBar />
  </>
);

export default Homepage;
