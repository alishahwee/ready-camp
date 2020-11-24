import React, { useState, useEffect } from "react";
import { Switch, Route } from "react-router-dom";
import axios from "axios";
import { useAuth } from "./hooks/auth";
import Homepage from "./pages/homepage";
import RegisterPage from "./pages/register-page";
import LoginPage from "./pages/login-page";
import ParkPage from "./pages/park-page";
import { GlobalStyles } from "twin.macro";
import "fontsource-pattaya";
import "fontsource-poppins";

const App = () => {
  const auth = useAuth();
  const [faveParks, setFaveParks] = useState([]);

  useEffect(() => {
    axios
      .get("/api/faves", {
        headers: {
          Authorization: "Bearer " + auth.token,
        },
      })
      .then((res) => setFaveParks(res.data))
      .catch(
        (err) =>
          err.response.status === 401 &&
          auth.setToken(null) /* Silently log user out. */
      );
  }, []);

  return (
    <>
      <GlobalStyles />
      <Switch>
        <Route exact path="/">
          <Homepage />
        </Route>
        <Route path="/register">
          <RegisterPage />
        </Route>
        <Route path="/login">
          <LoginPage />
        </Route>
        <Route path="/park/:id">
          <ParkPage />
        </Route>
      </Switch>
    </>
  );
};

export default App;
