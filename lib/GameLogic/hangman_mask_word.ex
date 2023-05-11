defmodule Hangman.MaskWord do
  def mask_word(%{matches: [], word: word, mask: mask} = _state) do
    String.replace(word, ~r/./, mask)
  end

  def mask_word(%{matches: matches, word: word, mask: mask} = _state) do
    matches = Enum.join(matches)
    String.replace(word, ~r/[^#{matches}]/, mask)
  end
end
