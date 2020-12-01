import React from "react";
import Helmet from "react-helmet";
import tw, { styled } from "twin.macro";
import bgHomepage from "../assets/bgHomepage.png";
import SearchBar from "../components/search-bar";
import Logo from "../components/logo";
import { LoginBtn, LogoutBtn, Faves } from "../components/btns";
import { useAuth } from "../hooks/auth";

const Wrapper = styled.div`
  ${tw`flex flex-col justify-center items-center h-screen p-4 text-center bg-cover bg-center pb-32 sm:pb-4`}
  background-image: url(${bgHomepage});
`;

const pStyle = tw`text-white text-lg mt-2 mb-4 font-medium tracking-wide`;

const Homepage = () => {
  const auth = useAuth();

  return (
    <Wrapper>
      <Helmet>
        <title>Homepage</title>
      </Helmet>
      <Logo textSize={tw`text-7xl`} />
      <p css={pStyle}>
        An all-in-one camping planner for Minnesota state parks
      </p>
      <SearchBar />
      {auth.token ? (
        <div tw="flex items-center">
          <Faves />
          <LogoutBtn />
        </div>
      ) : (
        <LoginBtn />
      )}
    </Wrapper>
  );
};

export default Homepage;
