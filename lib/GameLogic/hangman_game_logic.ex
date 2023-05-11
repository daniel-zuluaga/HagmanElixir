defmodule Hangman.GameLogic do

  alias(Hangman.Module.{String_Func_Per, Validate_Completed_Word})

  def init_game(word) do
    wordMin = String_Func_Per.string_downcase(word)
    %{word: wordMin, missies: [], matches: [], limit: 5, mask: "_", completed?: false}
  end

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
