defmodule Hangman do
  @moduledoc """
  The famous Hagman game
  """
  alias(Hangman.{View, GameLogic, Module.String_Func_Per, State})
  @doc """
    Start the game
  """

  @type stateGame() :: map()

  @spec start_game(String.t()) :: tuple()
  def start_game(word) do
    word
    |> GameLogic.init_game()
    |> View.format_response()
  end

  @doc """
  Valid the letter if the word contains the letter what take in the function
  ## Example:
    Hangman.start_game("hello") ## This help us start the game\n
    ---- mask word\n
    take_a_guess("e", state ## The state of the game)\n
    RT/= { "-e--", %{ completed?: false, limit: 5, mask: "_", matches: [], missies: [], word: "hello"}}\n
    ## Valida if the letter exists in the word
  """
  @spec take_a_guess(String.t(), stateGame()) :: tuple()
  def take_a_guess(letter, %State{limit: limit, completed?: false} = state) when limit > 0 do
    letter
    |> String_Func_Per.string_downcase()
    |> GameLogic.guess(state)
    |> View.format_response()
  end

  def take_a_guess(_letter, state) do
    View.format_response(state)
  end
end
