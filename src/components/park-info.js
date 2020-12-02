import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import tw from "twin.macro";
import axios from "axios";
import { useAuth } from "../hooks/auth";
import { FaveBtn, UnfaveBtn } from "./btns";
import { LoginMsg } from "./items";

const H1 = tw.h1`text-2xl text-yellow-800 font-semibold mr-2`;
const P = tw.p`text-lg`;
const A = tw.a`inline-block align-baseline font-bold text-sm text-yellow-500 hover:text-yellow-800`;

const ParkInfo = ({
  parkId,
  name,
  address,
  activities,
  url,
  faves,
  getFaves,
}) => {
  const auth = useAuth();
  const [isFave, setFave] = useState(false);

  useEffect(() => {
    setFave(false);
    for (const park of faves) {
      if (parkId == park.id) {
        setFave(true);
      }
    }
  }, [faves]);

  const favePark = (e) => {
    axios({
      method: "POST",
      url: `/api/${parkId}/favorite`,
      headers: {
        Authorization: "Bearer " + auth.token,
      },
    })
      .then((res) => {
        if (res.data.status === "success") {
          getFaves();
        }
      })
      .catch(
        (err) =>
          err.response.status === 401 &&
          auth.setToken(null) /* Silently log user out. */
      );
  };

  const unfavePark = (e) => {
    axios({
      method: "POST",
      url: `/api/${parkId}/unfavorite`,
      headers: {
        Authorization: "Bearer " + auth.token,
      },
    })
      .then((res) => {
        if (res.data.status === "success") {
          getFaves();
        }
      })
      .catch(
        (err) =>
          err.response.status === 401 &&
          auth.setToken(null) /* Silently log user out. */
      );
  };

  return (
    <div tw="m-2">
      {auth.token ? null : (
        <Link to="/login">
          <LoginMsg>Log in to favorite this park!</LoginMsg>
        </Link>
      )}
      <div tw="flex justify-between mb-2">
        <H1>{name}</H1>
        {auth.token &&
          (isFave ? (
            <UnfaveBtn parkId={parkId} onClick={unfavePark} />
          ) : (
            <FaveBtn parkId={parkId} onClick={favePark} />
          ))}
      </div>
      <P>{address}</P>
      <div tw="m-2">
        <p>Known for:</p>
        <ul tw="list-disc">
          {activities.map((activity, i) => (
            <li tw="ml-4" key={`activity-${i}`}>
              {activity}
            </li>
          ))}
        </ul>
      </div>
      <A href={url} target="_blank">
        Official Website
      </A>
    </div>
  );
};

export default ParkInfo;
