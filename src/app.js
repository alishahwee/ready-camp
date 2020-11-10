import React from "react";
import { Switch, Route } from "react-router-dom";
import Homepage from "./pages/homepage";
import { GlobalStyles } from "twin.macro";
import "fontsource-pattaya";
import "fontsource-poppins";

const App = () => (
  <>
    <GlobalStyles />
    <Switch>
      <Route path="/">
        <Homepage />
      </Route>
    </Switch>
  </>
);

export default App;
