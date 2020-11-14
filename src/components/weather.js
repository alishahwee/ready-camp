import React, { useState, useEffect } from "react";
import tw from "twin.macro";
import Loading from "./loading";

const Wrapper = tw.div`grid grid-cols-1`;
const MainView = tw.div`grid grid-flow-col grid-rows-3`;

const Weather = ({ parkId }) => {
  const [realtime, setRealtime] = useState({});

  useEffect(() => {
    fetch(`/api/weather/${parkId}`)
      .then((res) => res.json())
      .then((data) => {
        setRealtime(data);
      });
  }, []);

  return (
    <Wrapper>
      <Current
        description={realtime.description}
        temp={realtime.temp}
        windSpeed={realtime.windSpeed}
      />
    </Wrapper>
  );
};

const Current = ({ description, temp, windSpeed }) => (
  <MainView>
    <h2 tw="text-lg row-span-1 col-span-2">Current weather:</h2>
    <p tw="row-span-2">{description}</p>
    <p tw="row-span-1 col-span-1">{temp}</p>
    <p tw="row-span-1 col-span-1">{windSpeed}</p>
  </MainView>
);

export default Weather;
