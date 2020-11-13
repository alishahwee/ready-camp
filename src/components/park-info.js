import React from "react";
import tw from "twin.macro";

const H1 = tw.h1`font-body text-xl text-steal-teal`;
const P = tw.p`font-body text-lg`;
const A = tw.a`text-blue-500 hover:underline`;

const ParkInfo = ({ name, address, activities, url }) => (
  <div>
    <H1>{name}</H1>
    <P>{address}</P>
    <p>Known for:</p>
    <ul tw="list-disc">
      {activities.map((activity, i) => (
        <li tw="ml-4" key={`activity-${i}`}>
          {activity}
        </li>
      ))}
    </ul>
    <A href={url} target="_blank">
      Official Website
    </A>
  </div>
);

export default ParkInfo;
