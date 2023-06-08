defmodule Hangman.View do
  @moduledoc """
  Esta es la capa de presentacion para el juego hangman
  """

  alias(Hangman.{MaskWord, State})

  @doc """
  This functions help us to valid if the user win or lose
  """
  @type stateGame :: map()

  # @spec show_tries_to_player(stateGame()) :: binary()
  # def show_tries_to_player(%{limit: limit} = _state) do
  #   "how many attempts do you have left: #{limit}"
  # end

  @spec format_response(stateGame()) :: String.t()
  def format_response(%State{limit: limit, completed?: false} = state) when limit > 0 do
    MaskWord.mask_word(state)
  end

  def format_response(%State{limit: limit, word: word} = _state) when limit > 0 do
    "You won, word was: #{word}"
  end

  def format_response(%State{word: word} = _state) do
    "Game Over, word was: #{word}"
  end
end
