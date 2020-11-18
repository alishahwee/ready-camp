import React from "react";
import tw from "twin.macro";

const logoStyle = tw`font-display leading-tight text-maximum-yellow-red`;

const Logo = ({ textSize }) => <h1 css={[logoStyle, textSize]}>Ready, Camp!</h1>;

export default Logo;
