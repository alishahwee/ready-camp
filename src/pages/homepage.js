import React, { useState } from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import SearchBar from "../components/search-bar";

const Wrapper = tw.div`flex items-center h-screen p-4`;

const Homepage = () => (
  <Wrapper>
    <Helmet>
      <title>Homepage</title>
    </Helmet>
    <SearchBar />
  </Wrapper>
);

export default Homepage;
