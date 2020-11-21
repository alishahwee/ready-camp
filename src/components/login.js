import React from "react";
import { useForm } from "react-hook-form";
import tw from "twin.macro";

const Form = tw.form`flex flex-col h-48`;

const Login = () => {
  const { register, handleSubmit, errors } = useForm();
  const onSubmit = (data) => console.log(data);

  return (
    <Form onSubmit={handleSubmit(onSubmit)}>
      <h1>Login</h1>

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
