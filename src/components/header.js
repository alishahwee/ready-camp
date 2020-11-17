import React from "react";
import { Link } from "react-router-dom";
import tw from "twin.macro";
import Logo from "./logo";
import SearchBar from "./search-bar";

const Wrapper = tw.nav`flex w-screen fixed py-2 px-4 mb-2 bg-sage shadow rounded-b-md z-10`;

const Header = () => (
  <Wrapper>
    <Link to="/"><Logo textSize={tw`text-2xl`} /></Link>
  </Wrapper>
);

export default Header;
