import React, { useState } from "react";
import Helmet from "react-helmet";
import tw, { styled } from "twin.macro";
import bgHomepage from "../assets/bgHomepage.png";
import SearchBar from "../components/search-bar";
import Logo from "../components/logo";

const Wrapper = styled.div`
  ${tw`flex flex-col justify-center items-center h-screen p-4 text-center bg-cover bg-center`}
  background-image: url(${bgHomepage});
`;

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
