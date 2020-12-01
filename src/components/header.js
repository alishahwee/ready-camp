import React from "react";
import { Link } from "react-router-dom";
import tw from "twin.macro";
import { useAuth } from "../hooks/auth";
import Logo from "./logo";
import { Faves, LogoutBtn, LoginBtn } from "./btns";

const Wrapper = tw.nav`flex justify-between content-center items-center w-screen fixed py-2 px-4 mb-2 bg-yellow-100 shadow rounded-b-md z-10 font-body`;

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
