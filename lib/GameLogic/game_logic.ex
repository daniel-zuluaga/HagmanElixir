defmodule Hangman.GameLogic do
  @moduledoc """
  Main logic for the game
  """

  alias(Hangman.{Module.Validate_Completed_Word, State})

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
    State.newState(word)
  end

  @spec guess(stringWord(), stateGame()) :: stateGame()
  def guess(letter, state) do
    %{word: word, goal: goal, matches: matches, missies: misses, limit: limit} = state

    if MapSet.member?(goal, word) do
      matchesUni = MapSet.put(matches, letter)
      completed? = Validate_Completed_Word.validate_Completed_Word(goal, matchesUni)
      %{state | matches: matchesUni, completed?: completed?}
    else
      misses = MapSet.put(misses, letter)
      %{state | missies: misses, limit: limit - 1}
    end
  end
end
