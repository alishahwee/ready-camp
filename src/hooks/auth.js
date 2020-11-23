import { useState, useEffect, createContext, useContext } from "react";

export const AuthContext = createContext();

export function useAuth() {
  return useContext(AuthContext);
}

export function useProvideAuth() {
  const existingToken = JSON.parse(localStorage.getItem("token"));
  const [token, setToken] = useState(existingToken);

  useEffect(() => localStorage.setItem("token", JSON.stringify(token)), [
    token,
  ]);

  return { token, setToken };
}
