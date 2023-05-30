defmodule Hangman.GameLogic do

  @moduledoc """
  Main logic for the game
  """

  alias(Hangman.Module.{String_Func_Per, Validate_Completed_Word})

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
    %{word: wordMin, missies: [], matches: [], limit: 5, mask: "_", completed?: false}
  end

  @spec guess(stringWord(), stateGame()) :: stateGame()
  def guess(letter, state) do
    %{word: word, matches: matches, missies: misses, limit: limit} = state

    if String.contains?(word, letter) do
      matchesUni = [letter | matches]
      completed? = Validate_Completed_Word.validate_Completed_Word(word, matchesUni)
      %{state | matches: matchesUni, completed?: completed?}
    else
      misses = [letter | misses]
      %{state | missies: misses, limit: limit - 1}
    end
  end
end
