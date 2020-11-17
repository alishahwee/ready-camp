import React, { useState, useEffect } from "react";
import tw from "twin.macro";

const Wrapper = tw.div`grid grid-cols-1 self-center p-4`;
const MainView = tw.div`grid grid-flow-col grid-rows-3`;

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
    <h1 tw="text-steal-teal">Current weather:</h1>
    <MainView>
      <h3>Today</h3>
      <div dangerouslySetInnerHTML={{ __html: icon }} />
      <p tw="row-span-2">{description}</p>
      <p tw="row-span-1 col-span-1">{temp}</p>
      <p tw="row-span-1 col-span-1">{windSpeed}</p>
    </MainView>
  </>
);

export default Weather;
