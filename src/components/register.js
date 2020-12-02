import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { Redirect, useHistory, useLocation } from "react-router-dom";
import tw from "twin.macro";
import axios from "axios";
import { useAuth } from "../hooks/auth";
import { Form, Input, SubmitBtn, FormLbl, Label, Error } from "./forms-style";

const Register = () => {
  const { register, handleSubmit, watch, errors } = useForm();
  const auth = useAuth();
  const history = useHistory();
  const location = useLocation();

  const [errorMsg, setErrorMsg] = useState(null);
  const { from } = location.state || { from: { pathname: "/favorites" } };

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
    <Redirect to={(from, { state: { message: "You are already logged in." }})} />
  ) : (
    <Form onSubmit={handleSubmit(onSubmit)}>
      <FormLbl>Register</FormLbl>

      {errorMsg && <Error>{errorMsg}</Error>}

      <div tw="mb-4">
        <Label htmlFor="register-id">Username</Label>
        <Input
          id="register-id"
          name="username"
          type="text"
          ref={register({
            required: true,
            pattern: /^[a-z0-9_-]{3,15}$/i /* 3-16 chars, may include _ and - */,
          })}
          css={errors.username?.type === "required" && tw`border-red-500`}
        />
        {errors.username?.type === "required" && (
          <Error>Your input is required.</Error>
        )}
        {errors.username?.type === "pattern" && (
          <Error>
            Alphanumeric string that may include _ and - having a length of 3 to
            16 characters.
          </Error>
        )}
      </div>

      <div tw="mb-4">
        <Label htmlFor="register-email">Email</Label>
        <Input
          id="register-email"
          name="email"
          type="email"
          ref={register({
            required: true,
            pattern: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/,
          })}
          css={errors.username?.type === "required" && tw`border-red-500`}
        />
        {errors.email?.type === "required" && (
          <Error>Your input is required.</Error>
        )}
        {errors.email?.type === "pattern" && (
          <Error>Please enter a valid email.</Error>
        )}
      </div>

      <div tw="mb-4">
        <Label htmlFor="register-password">Password</Label>
        <Input
          id="register-password"
          name="password"
          type="password"
          ref={register({
            required: true,
            pattern: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/ /* Min 8 chars, 1 upper, 1 lower, 1 num, 1 special */,
          })}
          css={errors.username?.type === "required" && tw`border-red-500`}
        />
        {errors.password?.type === "required" && (
          <Error>Your input is required.</Error>
        )}
        {errors.password?.type === "pattern" && (
          <Error>
            Minimum eight characters, at least one upper case English letter,
            one lower case English letter, one number and one special character.
          </Error>
        )}
      </div>

      <div tw="mb-6">
        <Label htmlFor="register-confirm-password">Confirm Password</Label>
        <Input
          id="register-confirm-password"
          name="confirmPassword"
          type="password"
          ref={register({
            required: true,
            validate: (value) => value === watch("password"),
          })}
          css={errors.username?.type === "required" && tw`border-red-500`}
        />
        {errors.confirmPassword?.type === "required" && (
          <Error>Your input is required.</Error>
        )}
        {errors.confirmPassword?.type === "validate" && (
          <Error>Your passwords do not match.</Error>
        )}
      </div>

      <SubmitBtn>Submit</SubmitBtn>
    </Form>
  );
};

export default Register;
