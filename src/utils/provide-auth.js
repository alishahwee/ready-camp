import React from "react";
import { AuthContext, useProvideAuth } from "./hooks/auth";

function ProvideAuth({ children }) {
  const auth = useProvideAuth();
  return <AuthContext.Provider value={auth}>{children}</AuthContext.Provider>;
}

export default ProvideAuth;
