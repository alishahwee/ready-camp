import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router } from "react-router-dom";
import  ProvideAuth from "./utils/provide-auth";
import App from "./app";

ReactDOM.render(
  <React.StrictMode>
    <ProvideAuth>
      <Router>
        <App />
      </Router>
    </ProvideAuth>
  </React.StrictMode>,
  document.getElementById("root")
);
