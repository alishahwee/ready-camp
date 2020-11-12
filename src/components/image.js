import React from "react";
import tw from "twin.macro";

const ImgWrapper = tw.img`rounded-xl`;

const Image = ({ src, alt }) => <ImgWrapper src={src} alt={alt} />;

export default Image;
