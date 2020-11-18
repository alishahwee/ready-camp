import React, { useState, useEffect } from "react";
import tw from "twin.macro";

const Wrapper = tw.div`self-center p-4`;
const MainView = tw.div`grid grid-flow-row grid-rows-2 grid-cols-2 gap-2 p-4 rounded-lg bg-white place-items-center`;

const Weather = ({ parkId }) => {
  const [realtime, setRealtime] = useState(null);

  useEffect(() => {
    let isMounted = true;
    fetch(`/api/weather/${parkId}`)
      .then((res) => res.json())
      .then((data) => {
        if (isMounted) setRealtime(data);
      });
    return () => {
      isMounted = false;
    };
  }, []);

  return realtime ? (
    <Wrapper>
      <Current
        icon={realtime.icon}
        description={realtime.description}
        temp={realtime.temp}
        windSpeed={realtime.windSpeed}
      />
    </Wrapper>
  ) : null;
};

const Current = ({ icon, description, temp, windSpeed }) => (
  <>
    <h1 tw="font-body text-xl text-steal-teal">Current Weather</h1>
    <MainView>
      <div
        tw="h-20 w-20 row-span-2 col-span-1"
        dangerouslySetInnerHTML={{ __html: icon }}
      />
      <p tw="text-4xl md:text-5xl row-span-2 col-span-1">{temp}</p>
      <p tw="row-span-1 col-span-1 uppercase text-center text-gray-700 tracking-wide text-sm">
        {description}
      </p>
      <p tw="row-span-1 col-span-1">Wind: {windSpeed}</p>
    </MainView>
  </>
);

export default Weather;
