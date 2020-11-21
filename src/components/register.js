import React from "react";
import { useForm } from "react-hook-form";
import tw from "twin.macro";

const Form = tw.form`flex flex-col h-64 w-64`;

const Register = () => {
  const { register, handleSubmit, watch, errors } = useForm();
  const onSubmit = (data) => console.log(data);

  return (
    <Form onSubmit={handleSubmit(onSubmit)}>
      <h1>Register</h1>

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
