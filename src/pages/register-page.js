import React from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Header from "../components/header";
import Register from "../components/register";

const Wrapper = tw.div`flex justify-center items-center h-screen`;

const RegisterPage = () => (
  <>
    <Header />
    <Helmet>
      <title>Register</title>
    </Helmet>
    <Wrapper>
      <Register />
    </Wrapper>
  </>
);

export default RegisterPage;
