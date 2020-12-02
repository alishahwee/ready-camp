import React, { useState, useEffect } from "react";
import { Switch, Route, withRouter } from "react-router-dom";
import axios from "axios";
import { useAuth } from "./hooks/auth";
import Homepage from "./pages/homepage";
import RegisterPage from "./pages/register-page";
import LoginPage from "./pages/login-page";
import ParkPage from "./pages/park-page";
import FavoritesPage from "./pages/favorites-page";
import PrivateRoute from "./utils/private-route";
import { GlobalStyles } from "twin.macro";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import "fontsource-pattaya";
import "fontsource-poppins";

const App = ({ location }) => {
  const auth = useAuth();
  const [faveParks, setFaveParks] = useState([]);

  useEffect(() => {
    if (auth.token) getFaves();
  }, [auth.token]);

  useEffect(() => {
    if (location.state?.message) {
      toast(location.state.message);
    }
  }, [location.state?.message])

  const getFaves = () => {
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
  };

  return (
    <>
      <ToastContainer />
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
          <ParkPage faves={faveParks} getFaves={getFaves} />
        </Route>
        <PrivateRoute path="/parks/favorites">
          <FavoritesPage faves={faveParks} />
        </PrivateRoute>
      </Switch>
    </>
  );
};

export default withRouter(App);
