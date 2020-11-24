import React from "react";
import { Link } from "react-router-dom";
import tw from "twin.macro";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHeart as fasHeart } from "@fortawesome/free-solid-svg-icons";
import { faHeart as farHeart } from "@fortawesome/free-regular-svg-icons";
import { useAuth } from "../hooks/auth";

const RegBtn = tw.button`bg-green-500 hover:bg-green-700 text-white font-medium py-1 px-2 rounded`;

export const Faves = () => (
  <Link>
    <FontAwesomeIcon icon={fasHeart} size="lg" tw="text-red-400 mx-2" />
  </Link>
);

export const FaveBtn = ({ onClick }) => (
  <button onClick={onClick}>
    <FontAwesomeIcon icon={farHeart} size="lg" tw="text-red-400" />
  </button>
);

export const UnfaveBtn = ({ onClick }) => (
  <button onClick={onClick}>
    <FontAwesomeIcon icon={fasHeart} size="lg" tw="text-red-400" />
  </button>
);

export const LogoutBtn = () => {
  const auth = useAuth();

  const logOut = () => {
    axios({
        method: "POST",
        url: "/auth/logout",
        headers: {
          Authorization: "Bearer " + auth.token,
        },
      })
      .then((res) => {
        console.log(res.data.message);
        auth.setToken(null);
      })
      .catch(
        (err) =>
          err.response.status === 401 && console.log(err.response.data.message)
      );
  };

  return <RegBtn onClick={logOut}>Log Out</RegBtn>;
};

export const LoginBtn = () => (
  <Link to="/login">
    <RegBtn>Log In</RegBtn>
  </Link>
);
