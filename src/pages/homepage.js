import React, { useState } from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";

const Homepage = () => (
  <>
    <Helmet>
      <title>Homepage</title>
    </Helmet>
    <h1 tw="font-body">Testing homepage.</h1>
  </>
);

export default Homepage;
