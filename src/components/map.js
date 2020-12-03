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

    new mapboxgl.Marker().setLngLat([lng, lat]).addTo(map);

    const directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
    });

    map.addControl(directions, "top-left");
    directions.setDestination([lng, lat]);

    map.on("load", () => {
      console.log("Map loaded.");
      const directionControls = document.querySelector(
        ".mapboxgl-ctrl-directions"
      );
      directionControls.style.minWidth = "225px";
    });

    directions.on("route", () => {
      console.log("Route set.");
      document.querySelector(".directions-control-directions").style.height =
        "250px";
    });

    map.on("move", () => {
      setLng(map.getCenter().lng.toFixed(4));
      setLat(map.getCenter().lat.toFixed(4));
      setZoom(map.getZoom().toFixed(2));
    });

    map.scrollZoom.disable();

    const nav = new mapboxgl.NavigationControl({
      showCompass: false,
    });
    map.addControl(nav, "top-right");
  }, []);

  return (
    <div
      tw="relative sm:m-4 md:w-full rounded overflow-hidden z-10"
      css={{ height: "400px;" }}
    >
      <div ref={(el) => (mapContainer.current = el)} tw="absolute inset-0" />
    </div>
  );
};

export default Map;
