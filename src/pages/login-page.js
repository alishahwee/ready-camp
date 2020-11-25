import React from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Header from "../components/header";
import Login from "../components/login";

export const Wrapper = tw.div`flex justify-center items-center h-screen p-4 pt-16 bg-orange-100`;

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
