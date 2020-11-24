import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { Redirect, useHistory, useLocation } from "react-router-dom";
import tw from "twin.macro";
import axios from "axios";
import { useAuth } from "../hooks/auth";

const Form = tw.form`flex flex-col h-48`;

const Login = () => {
  const { register, handleSubmit, errors } = useForm();
  const auth = useAuth();
  const history = useHistory();
  const location = useLocation();

  const [errorMsg, setErrorMsg] = useState(null);
  const { from } = location.state || { from: { pathname: "/" } };

  const onSubmit = (data) => {
    console.log(data);
    axios
      .post("/auth/login", data)
      .then((res) => {
        if (res.status === 200) {
          console.log(res.data.token, res.data.message);
          auth.setToken(res.data.token);
          history.replace(from, { message: res.data.message });
        }
      })
      .catch((err) => {
        if (err.response) {
          setErrorMsg(err.response.data.message);
        }
      });
  };

  return auth.token ? (
    <Redirect to={from, { message: "You are already logged in." }} />
  ) : (
    <Form onSubmit={handleSubmit(onSubmit)}>
      <h1>Login</h1>

      {errorMsg && <p>{errorMsg}</p>}

      <label htmlFor="register-id">Username</label>
      <input
        id="register-id"
        name="username"
        type="text"
        ref={register({ required: true })}
      />
      {errors.username?.type === "required" && <p>Your input is required.</p>}

      <label htmlFor="register-password">Password</label>
      <input
        id="register-password"
        name="password"
        type="password"
        ref={register({ required: true })}
      />
      {errors.password?.type === "required" && <p>Your input is required.</p>}

      <input type="submit" />
    </Form>
  );
};

export default Login;
