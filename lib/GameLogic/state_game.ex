defmodule Hangman.State do
  alias Hangman.Module.String_Func_Per

  @enforce_keys [:word, :goal]
  defstruct [
    :word,
    :goal,
    missies: MapSet.new(),
    matches: MapSet.new(),
    limit: 5,
    mask: "_",
    completed?: false
  ]

  @spec newState(String.t()) :: %Hangman.State{}
  def newState(word) do
    wordMin = String_Func_Per.string_downcase(word)
    goal = wordMin |> String.graphemes() |> MapSet.new()

    struct!(__MODULE__, [word: word, goal: goal])
  end
end
