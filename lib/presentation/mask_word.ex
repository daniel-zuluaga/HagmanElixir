defmodule Hangman.MaskWord do
  @moduledoc """
  This inside the presentation layer help us to mask the words
  """

  @doc """
  The function mask_word help us to mask the word to the hangman game \n
  And the other function help us a unmask when you guess a letter of the word
  """
  @type stateGame() :: map()

  @spec mask_word(stateGame()) :: String.t()
  def mask_word(%{matches: [], word: word, mask: mask} = _state) do
    String.replace(word, ~r/./, mask)
  end

  def mask_word(%{matches: matches, word: word, mask: mask} = _state) do
    matches = Enum.join(matches)
    String.replace(word, ~r/[^#{matches}]/, mask)
  end
end
