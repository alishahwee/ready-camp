import React from "react";
import Helmet from "react-helmet";
import Header from "../components/header";
import Register from "../components/register";
import { Wrapper } from "./login-page";

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
