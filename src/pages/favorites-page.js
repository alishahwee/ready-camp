import React from "react";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Header from "../components/header";
import FaveCard from "../components/fave-card";

const Wrapper = tw.div`flex flex-wrap justify-center`;

const FavoritesPage = ({ faves }) => (
  <div tw="flex flex-col items-center font-body">
    <Helmet>
      <title>Favorite Parks</title>
    </Helmet>
    <Header />
    <div tw="flex flex-col items-center p-4 pt-20 max-w-screen-lg overflow-hidden">
      <h1 tw="self-start font-display text-2xl pb-2 mb-4 w-full border-b">
        Your Favorite Parks
      </h1>
      <Wrapper>
        {faves.length == 0 && (
          <p>Oh no! You don't have any favorite parks yet.</p>
        )}
        {faves.map((park) => (
          <FaveCard
            key={`park-${park.id}`}
            parkId={park.id}
            name={park.name}
            imgUrl={park.image}
          />
        ))}
      </Wrapper>
    </div>
  </div>
);

export default FavoritesPage;
