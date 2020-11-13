import React, { useState, useEffect, useRef } from "react";
import mapboxgl from "mapbox-gl";
import "twin.macro";

const Map = ({ initLng, initLat, initZoom }) => {
  const mapContainer = useRef(null);

  const [lng, setLng] = useState(initLng);
  const [lat, setLat] = useState(initLat);
  const [zoom, setZoom] = useState(initZoom);

  useEffect(() => {
    mapboxgl.accessToken = process.env.MAPBOX_TOKEN;
    const map = new mapboxgl.Map({
      container: mapContainer.current,
      style: "mapbox://styles/mapbox/outdoors-v11",
      center: [lng, lat], // starting position [lng, lat]
      zoom: zoom, // starting zoom
    });

    map.on("move", () => {
      setLng(map.getCenter().lng.toFixed(4));
      setLat(map.getCenter().lat.toFixed(4));
      setZoom(map.getZoom().toFixed(2));
    });
  }, []);

  return <div ref={(el) => (mapContainer.current = el)} tw="h-64" />;
};

export default Map;
