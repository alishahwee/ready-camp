import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Loading from "../components/loading";
import Header from "../components/header";
import Image from "../components/image";
import ParkInfo from "../components/park-info";
import Weather from "../components/weather";
import Map from "../components/map";
import Items from "../components/items";

const Wrapper = tw.div`grid grid-cols-1 justify-items-center pt-16 px-4`;
const InfoCard = tw.div`flex flex-col my-3 w-full bg-lavender-fade p-2 rounded-lg max-w-screen-lg overflow-hidden shadow`;

const ParkPage = ({ faves, getFaves }) => {
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
    <>
      <Header />
      <Wrapper>
        <Helmet>
          <title>{name}</title>
        </Helmet>
        <InfoCard tw="md:flex-row">
          <Image src={imgUrls[0]} alt={`A snapshot of ${name}`} />
          <ParkInfo
            parkId={id}
            name={name}
            address={address}
            activities={activities}
            url={url}
            faves={faves}
            getFaves={getFaves}
          />
        </InfoCard>
        <InfoCard tw="p-0">
          <Weather parkId={id} />
          <Map initLng={coords.lon} initLat={coords.lat} initZoom={12} />
        </InfoCard>
        <InfoCard>
          <Items />
        </InfoCard>
      </Wrapper>
    </>
  ) : (
    <Wrapper tw="items-center h-screen">
      <Loading />
    </Wrapper>
  );
};

export default ParkPage;
