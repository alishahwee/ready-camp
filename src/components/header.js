import React, { useState } from "react";
import { Link, useLocation } from "react-router-dom";
import tw from "twin.macro";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSearch } from "@fortawesome/free-solid-svg-icons";
import { useAuth } from "../hooks/auth";
import Logo from "./logo";
import SearchBar from "./search-bar";
import { Faves, LogoutBtn, LoginBtn } from "./btns";

const Wrapper = tw.nav`flex justify-between content-center items-center w-screen py-2 px-4 bg-artichoke shadow rounded-b-md font-body`;

const Header = () => {
  const auth = useAuth();
  const location = useLocation();
  const [showSearch, setShowSearch] = useState(false);

  const toggleSearch = () => setShowSearch(!showSearch);

  return (
    <div tw="fixed z-50">
      <Wrapper>
        <Link to="/">
          <Logo textSize={tw`text-2xl md:text-3xl`} />
        </Link>
        <div tw="flex">
          <button onClick={toggleSearch}>
            <FontAwesomeIcon icon={faSearch} size="lg" tw="mx-2" />
          </button>
          {auth.token ? (
            <div>
              <Faves />
              <LogoutBtn />
            </div>
          ) : (
            location.pathname != "/login" && <LoginBtn />
          )}
        </div>
      </Wrapper>
      <div
        tw="absolute max-w-sm bg-lavender-fade pt-2 px-2 rounded-lg right-0 shadow"
        css={{ display: showSearch ? "block;" : "none;" }}
      >
        <SearchBar />
      </div>
    </div>
  );
};

export default Header;
