import React from "react";
import tw from "twin.macro";

const H1 = tw.h1`font-body text-2xl text-steal-teal font-semibold mb-2`;
const P = tw.p`font-body text-lg`;
const A = tw.a`text-blue-500 hover:underline`;

const ParkInfo = ({ name, address, activities, url }) => (
  <div tw="m-2">
    <H1>{name}</H1>
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

export default ParkInfo;
