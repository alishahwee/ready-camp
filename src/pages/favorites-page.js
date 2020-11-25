import React from "react";
import Helmet from "react-helmet";
import Header from "../components/header";
import FaveCard from "../components/fave-card";
import { Wrapper } from "./park-page";

const FavoritesPage = ({ faves }) => (
  <>
    <Helmet>
      <title>Favorite Parks</title>
    </Helmet>
    <Header />
    <Wrapper>
      {faves.map((park) => (
        <FaveCard parkId={park.id} name={park.name} imgUrl={park.image} />
      ))}
    </Wrapper>
  </>
);

export default FavoritesPage;
