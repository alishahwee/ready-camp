import React from "react";
import tw from "twin.macro";
import { Link } from "react-router-dom";

const Card = tw.div``;

const FaveCard = ({ parkId, name, imgUrl }) => (
  <Link to={`/park/${parkId}`}>
    <Card>
      <img src={imgUrl} />
      <h2>{name}</h2>
    </Card>
  </Link>
);

export default FaveCard;
