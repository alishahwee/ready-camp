import React from "react";
import { Link } from "react-router-dom";
import tw from "twin.macro";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHeart } from "@fortawesome/free-solid-svg-icons";

export const Faves = () => (
  <Link>
    <FontAwesomeIcon icon={faHeart} size="lg" tw="text-red-400" />
  </Link>
);
