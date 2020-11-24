import { useState, createContext, useContext } from "react";

export const AuthContext = createContext();

export function useAuth() {
  return useContext(AuthContext);
}

export function useProvideAuth() {
  const existingToken = JSON.parse(localStorage.getItem("token"));
  const [token, setToken] = useState(existingToken);

  const setAuthToken = (data) => {
    localStorage.setItem("token", JSON.stringify(data));
    setToken(data);
  }

  return { token, setToken: setAuthToken };
}
