import React from "react";
import tw from "twin.macro";
import { Link } from "react-router-dom";

const Card = tw.div`bg-lavender-fade rounded-lg shadow p-4 h-full`;

const FaveCard = ({ parkId, name, imgUrl }) => (
  <div tw="px-2 mb-4 sm:w-1/2 md:w-1/3">
    <Card>
      <Link to={`/park/${parkId}`}>
        <img src={imgUrl} tw="mb-4 rounded" />
        <h2 tw="text-xl text-dark-lava font-semibold w-full">{name}</h2>
      </Link>
    </Card>
  </div>
);

export default FaveCard;
