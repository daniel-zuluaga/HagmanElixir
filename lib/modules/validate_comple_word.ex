defmodule Hangman.Module.Validate_Completed_Word do

  @moduledoc """
  This module help to other modules with simple functions, how valid if is completed the word
  """

  @doc """
  verification if the word is completed
  """
  @type wordString() :: String.t()
  @type containLetter() :: list(String.t())

  @spec validate_Completed_Word(wordString(), containLetter()) :: boolean()
  def validate_Completed_Word(word, list_verifi) do
    word |> String.graphemes() |> Enum.all?(&(&1 in list_verifi))
  end
end
