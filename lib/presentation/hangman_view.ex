defmodule Hangman.View do
  alias(Hangman.MaskWord, as: MaskWord)

  def format_response(%{limit: limit, completed?: false} = state) when limit > 0 do
    {MaskWord.mask_word(state), state}
  end

  def format_response(%{limit: limit, word: word} = state) when limit > 0 do
    {"You won, word was: #{word}", state}
  end

  def format_response(%{word: word} = state) do
    {"Game Over, word was: #{word}", state}
  end
end
