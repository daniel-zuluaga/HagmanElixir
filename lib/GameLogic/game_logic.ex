defmodule Hangman.GameLogic do
  @moduledoc """
  Main logic for the game
  """

  alias(Hangman.{Module.Validate_Completed_Word, Module.String_Func_Per, State})

  @doc """
  The function init_game is for begin the game of hangman \n
  The function guess help us to valid if that letter the contain\n
  the word it is added to the list matches but the contain it\n
  is added to the list of failures
  """
  @type stateGame() :: map()
  @type stringWord() :: String.t()

  @spec init_game(stringWord()) :: stateGame()
  def init_game(word) do
    wordMin = String_Func_Per.string_downcase(word)
    State.newState(wordMin)
  end

  @spec guess(String.t(), map()) :: map()
  def guess(letter, %State{} = state) do
    %{goal: goal, matches: matches, missies: misses, limit: limit} = state

    matchesUni = MapSet.put(matches, letter)
    completed? = Validate_Completed_Word.validate_Completed_Word(goal, matchesUni)

    if MapSet.member?(goal, letter) do
      %{state | matches: matchesUni, completed?: completed?}
    else
      misses = MapSet.put(misses, letter)
      %{state | missies: misses, limit: limit - 1}
    end
  end
end
