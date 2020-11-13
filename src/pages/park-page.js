import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Loading from "../components/loading";
import Image from "../components/image";
import ParkInfo from "../components/park-info";
import Weather from "../components/weather";
import Map from "../components/map";

const Wrapper = tw.div`grid grid-cols-1 items-center p-4`;

const ParkPage = () => {
  const { id } = useParams();
  const [activities, setActivities] = useState([]);
  const [address, setAddress] = useState("");
  const [coords, setCoords] = useState({});
  const [imgUrls, setImgUrls] = useState([]);
  const [name, setName] = useState("");
  const [url, setUrl] = useState("");
  const [dataLoaded, setDataLoaded] = useState(false);

  useEffect(() => {
    fetch(`/api/park/${id}`)
      .then((res) => res.json())
      .then((data) => {
        const { activities, address, coordinates, images, name, url } = data;
        setActivities(activities);
        setAddress(address);
        setCoords(coordinates);
        setImgUrls(images);
        setName(name);
        setUrl(url);
        setDataLoaded(true);
      });
  }, []);

  return dataLoaded ? (
    <Wrapper>
      <Helmet>
        <title>{name}</title>
      </Helmet>
      <Image src={imgUrls[0]} alt={`A snapshot of ${name}`} />
      <ParkInfo
        name={name}
        address={address}
        activities={activities}
        url={url}
      />
      <Weather parkId={id} />
      <Map initLng={coords.lon} initLat={coords.lat} initZoom={12} />
    </Wrapper>
  ) : (
    <Wrapper tw="h-screen">
      <Loading />
    </Wrapper>
  );
};

export default ParkPage;
