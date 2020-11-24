import React from "react";
import { Link } from "react-router-dom";
import tw from "twin.macro";
import { useAuth } from "../hooks/auth";
import Logo from "./logo";
import SearchBar from "./search-bar";
import { Faves, LogoutBtn, LoginBtn } from "./btns";

const Wrapper = tw.nav`flex justify-between content-center w-screen fixed py-2 px-4 mb-2 bg-sage shadow rounded-b-md z-10`;

const Header = () => {
  const auth = useAuth();

  return (
    <Wrapper>
      <Link to="/">
        <Logo textSize={tw`text-3xl`} />
      </Link>
      {auth.token ? (
        <div>
          <Faves />
          <LogoutBtn />
        </div>
      ) : <LoginBtn />}
    </Wrapper>
  );
};

export default Header;
