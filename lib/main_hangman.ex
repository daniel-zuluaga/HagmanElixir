        # {"__________",
        # %Hangman.State{
        #   word: "#{Goal.generate()}",
        #   goal: MapSet.new(["a", "h", "i", "m", "o", "p", "t"]),
        #   missies: MapSet.new([]),
        #   matches: MapSet.new([]),
        #   limit: 5,
        #   mask: "_",
        #   completed?: false
        # }}

        # "_______a__"

defmodule Hangman do
  @moduledoc """
  The famous Hagman game
  """
  alias(Hangman.{View, GameLogic, Module.String_Func_Per, State, Goal})

  @doc """
    Start the game
  """

  @type stateGame() :: map()

  @spec start_game() :: tuple()
  def start_game() do
    Goal.generate()
    |> GameLogic.init_game()
    |> View.format_response()
  end

  @doc """
  Valid the letter if the word contains the letter what take in the function

  ## Example
        iex> {_word, state} = Hangman.start_game()
        iex> Hangman.take_a_guess("a", state) |> elem(0)

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
