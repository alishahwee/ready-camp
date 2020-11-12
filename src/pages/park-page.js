import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import Helmet from "react-helmet";
import tw from "twin.macro";

const ParkPage = () => {
  const { id } = useParams();
  const [data, setData] = useState({});
  const { activities, address, coordinates, images, name, url} = data;

  useEffect(() => {
    fetch(`/api/park/${id}`)
      .then((res) => res.json())
      .then((data) => setData(data));
  }, []);

  return (
    <>
      <Helmet>
        <title>{name}</title>
      </Helmet>
      <p>Showing page for park of id: {id}</p>
    </>
  );
};

export default ParkPage;
