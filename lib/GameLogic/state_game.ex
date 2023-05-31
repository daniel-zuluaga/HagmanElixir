defmodule Hangman.State do
  alias Hangman.Module.String_Func_Per

  @spec newState(String.t()) :: map()
  def newState(word) do
    wordMin = String_Func_Per.string_downcase(word)
    goal = word |> String.graphemes() |> MapSet.new()

    %{
      word: wordMin,
      goal: goal,
      missies: MapSet.new(),
      matches: MapSet.new(),
      limit: 5,
      mask: "_",
      completed?: false
    }
  end
end
