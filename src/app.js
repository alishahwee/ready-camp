import React from "react";
import { Switch, Route } from "react-router-dom";
import Homepage from "./pages/homepage";
import RegisterPage from "./pages/register-page";
import LoginPage from "./pages/login-page";
import ParkPage from "./pages/park-page"
import { GlobalStyles } from "twin.macro";
import "fontsource-pattaya";
import "fontsource-poppins";

const App = () => (
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

export default App;
