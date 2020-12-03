import React from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import { Link } from "react-router-dom";
import Header from "../components/header";
import { SubmitBtn } from "../components/forms-style";

const Wrapper = tw.div`flex flex-col justify-center items-center h-screen font-body`;

const NotFoundPage = () => (
  <>
    <Helmet>
      <title>Page Not Found</title>
    </Helmet>
    <Header />
    <Wrapper>
      <p tw="text-9xl mb-4">404</p>
      <p tw="text-xl mb-6">Oh no! That page wasn't found.</p>
      <Link to="/">
        <SubmitBtn>Go back home</SubmitBtn>
      </Link>
    </Wrapper>
  </>
);

export default NotFoundPage;
