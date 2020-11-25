import tw from "twin.macro";

export const Form = tw.form`max-w-xs shadow-md rounded-md px-8 pt-6 pb-8 mb-4 bg-white`;
export const FormLbl = tw.h1`font-semibold self-center mb-4`
export const Input = tw.input`shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline`;
export const Label = tw.label`block text-gray-700 text-sm font-bold mb-2`;
export const Error = tw.p`text-red-500 text-xs italic mt-3`;
export const SubmitBtn = tw.button`bg-orange-400 hover:bg-orange-600 text-white font-bold py-2 px-4 rounded-full focus:outline-none focus:shadow-outline`;
