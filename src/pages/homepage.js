import React, { useState } from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import SearchBar from "../components/search-bar";
import Logo from "../components/logo";

const Wrapper = tw.div`flex flex-col justify-center items-center h-screen p-4 text-center`;

const Homepage = () => (
  <Wrapper>
    <Helmet>
      <title>Homepage</title>
    </Helmet>
    <Logo />
    <SearchBar />
  </Wrapper>
);

export default Homepage;
