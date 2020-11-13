import React, { useState } from "react";
import Helmet from "react-helmet";
import tw, { styled } from "twin.macro";
import bgHomepage from "../assets/bgHomepage.png";
import SearchBar from "../components/search-bar";
import Logo from "../components/logo";

const Wrapper = styled.div`
  ${tw`flex flex-col justify-center items-center h-screen p-4 text-center bg-cover bg-center pb-32 sm:pb-4`}
  background-image: url(${bgHomepage});
`;

const pStyle = tw`text-white text-lg mt-2 mb-4 font-medium tracking-wide`;

const Homepage = () => (
  <Wrapper>
    <Helmet>
      <title>Homepage</title>
    </Helmet>
    <Logo />
    <p css={pStyle}>An all-in-one camping planner for Minnesota state parks</p>
    <SearchBar />
  </Wrapper>
);

export default Homepage;
