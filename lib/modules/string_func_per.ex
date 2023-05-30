defmodule Hangman.Module.String_Func_Per do

  @moduledoc """
  This module help to other modules with simple functions
  """

  @doc """
  The function string_downcase help us to put lowercase the letter of the word
  """
  @spec string_downcase(String.t()) :: String.t()
  def string_downcase(word) do
    String.downcase(word)
  end
end
