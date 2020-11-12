import React, { useEffect } from "react";
import { useParams } from "react-router-dom";
import Helmet from "react-helmet";
import tw from "twin.macro";

const ParkPage = () => {
  const { id } = useParams();

  useEffect(() => {
    fetch(`/api/park/${id}`)
      .then((res) => res.json())
      .then((data) => console.log(data));
  }, []);

  return (
    <>
      <Helmet>
        <title></title>
      </Helmet>
      <p>Showing page for park of id: {id}</p>
    </>
  );
};

export default ParkPage;
