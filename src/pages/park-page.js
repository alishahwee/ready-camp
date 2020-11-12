import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import Helmet from "react-helmet";
import tw from "twin.macro";
import Image from "../components/image";

const Wrapper = tw.div`flex flex-col items-center h-screen p-4`;

const ParkPage = () => {
  const { id } = useParams();
  const [activities, setActivities] = useState([]);
  const [address, setAddress] = useState("");
  const [coords, setCoords] = useState({});
  const [imgUrls, setImgUrls] = useState([]);
  const [name, setName] = useState("");
  const [url, setUrl] = useState("");

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
      });
  }, []);

  return (
    <Wrapper>
      <Helmet>
        <title>{name}</title>
      </Helmet>
      <Image src={imgUrls[0]} alt={`A snapshot of ${name}`} />
      <p>Showing page for park: {name}</p>
    </Wrapper>
  );
};

export default ParkPage;
