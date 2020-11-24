import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { Redirect, useHistory, useLocation } from "react-router-dom";
import tw from "twin.macro";
import axios from "axios";
import { useAuth } from "../hooks/auth";

const Form = tw.form`flex flex-col h-64 w-64`;

const Register = () => {
  const { register, handleSubmit, watch, errors } = useForm();
  const auth = useAuth();
  const history = useHistory();
  const location = useLocation();

  const [errorMsg, setErrorMsg] = useState(null);
  const { from } = location.state || { from: { pathname: "/" } };

  const onSubmit = (data) => {
    console.log(data);
    axios
      .post("/auth/register", data)
      .then((res) => {
        if (res.status === 201) {
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
      <h1>Register</h1>

      {errorMsg && <p>{errorMsg}</p>}

      <label htmlFor="register-id">Username</label>
      <input
        id="register-id"
        name="username"
        type="text"
        ref={register({
          required: true,
          pattern: /^[a-z0-9_-]{3,15}$/i /* 3-16 chars, may include _ and - */,
        })}
      />
      {errors.username?.type === "required" && <p>Your input is required.</p>}
      {errors.username?.type === "pattern" && (
        <p>
          Alphanumeric string that may include _ and - having a length of 3 to
          16 characters.
        </p>
      )}

      <label htmlFor="register-email">Email</label>
      <input
        id="register-email"
        name="email"
        type="email"
        ref={register({
          required: true,
          pattern: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/,
        })}
      />
      {errors.email?.type === "required" && <p>Your input is required.</p>}
      {errors.email?.type === "pattern" && <p>Please enter a valid email.</p>}

      <label htmlFor="register-password">Password</label>
      <input
        id="register-password"
        name="password"
        type="password"
        ref={register({
          required: true,
          pattern: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/ /* Min 8 chars, 1 upper, 1 lower, 1 num, 1 special */,
        })}
      />
      {errors.password?.type === "required" && <p>Your input is required.</p>}
      {errors.password?.type === "pattern" && (
        <p>
          Minimum eight characters, at least one upper case English letter, one
          lower case English letter, one number and one special character.
        </p>
      )}

      <label htmlFor="register-confirm-password">Confirm Password</label>
      <input
        id="register-confirm-password"
        name="confirmPassword"
        type="password"
        ref={register({
          required: true,
          validate: (value) => value === watch("password"),
        })}
      />
      {errors.confirmPassword?.type === "required" && (
        <p>Your input is required.</p>
      )}
      {errors.confirmPassword?.type === "validate" && (
        <p>Your passwords do not match.</p>
      )}

      <input type="submit" />
    </Form>
  );
};

export default Register;
