import React, { useState, useEffect } from "react";
import { useForm } from "react-hook-form";
import { useHistory, useLocation, Link } from "react-router-dom";
import axios from "axios";
import tw from "twin.macro";
import { useAuth } from "../hooks/auth";
import { Form, Input, SubmitBtn, FormLbl, Label, Error } from "./forms-style";

const Login = () => {
  const { register, handleSubmit, errors } = useForm();
  const auth = useAuth();
  const history = useHistory();
  const location = useLocation();

  const [errorMsg, setErrorMsg] = useState(null);
  const { from } = location.state || { from: { pathname: "/parks/favorites" } };

  useEffect(() => {
    if (auth.token)
      history.replace(from, { message: "You are already logged in." });
  }, []);

  const onSubmit = (data) => {
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

  return (
    <Form onSubmit={handleSubmit(onSubmit)}>
      <FormLbl>Log In</FormLbl>

      {errorMsg && <Error>{errorMsg}</Error>}
      <div tw="mb-4">
        <Label htmlFor="register-id">Username</Label>
        <Input
          id="register-id"
          name="username"
          type="text"
          ref={register({ required: true })}
          css={errors.username?.type === "required" && tw`border-red-500`}
        />
        {errors.username?.type === "required" && (
          <Error>Your input is required.</Error>
        )}
      </div>

      <div tw="mb-6">
        <Label htmlFor="register-password">Password</Label>
        <Input
          id="register-password"
          name="password"
          type="password"
          ref={register({ required: true })}
          css={errors.username?.type === "required" && tw`border-red-500`}
        />
        {errors.password?.type === "required" && (
          <Error>Your input is required.</Error>
        )}
      </div>

      <div tw="flex items-center justify-between">
        <SubmitBtn>Submit</SubmitBtn>
        <Link
          to="/register"
          tw="inline-block align-baseline font-bold text-sm text-yellow-500 hover:text-dark-lava"
        >
          Register Account
        </Link>
      </div>
    </Form>
  );
};

export default Login;
