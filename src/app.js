import React from "react";
import { Switch, Route } from "react-router-dom";
import Homepage from "./pages/homepage";

const App = () => (
  <Switch>
    <Route path="/">
      <Homepage />
    </Route>
  </Switch>
);

export default App;
