import React from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Header from "../components/header";
import Login from "../components/login";

const Wrapper = tw.div`flex justify-center items-center h-screen`;

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
