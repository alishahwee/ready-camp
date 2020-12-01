import React from "react";
import Helmet from "react-helmet";
import tw, { styled } from "twin.macro";
import Header from "../components/header";
import Login from "../components/login";
import bgRegisterLogin from "../assets/bgRegisterLogin.jpg";

export const Wrapper = styled.div`
  ${tw`flex justify-center items-center h-screen bg-cover bg-center p-4 pt-16 bg-yellow-100`}
  background-image: url(${bgRegisterLogin});
`;

const LoginPage = () => (
  <>
    <Header />
    <Helmet>
      <title>Login</title>
    </Helmet>
    <Wrapper>
      <Login />
    </Wrapper>
  </>
);

export default LoginPage;
