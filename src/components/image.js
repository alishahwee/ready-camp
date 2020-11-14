import React from "react";
import tw from "twin.macro";

const ImgWrapper = tw.div`rounded m-2 md:m-3 pb-1/2 md:pr-1/2 md:pb-1/3 lg:pr-2/3 relative overflow-hidden`;

const Image = ({ src, alt }) => (
  <ImgWrapper>
    <img tw="absolute object-cover w-full h-full" src={src} alt={alt} />
  </ImgWrapper>
);

export default Image;
