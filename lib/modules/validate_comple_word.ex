defmodule Hangman.Module.Validate_Completed_Word do
  def validate_Completed_Word(word, list_verifi) do
    word |> String.graphemes() |> Enum.all?(&(&1 in list_verifi))
  end
end
