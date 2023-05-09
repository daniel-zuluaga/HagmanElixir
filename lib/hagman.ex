defmodule Hagman do
  @moduledoc """
  The famous Hagman game
  """
  @doc """
    Start the game
  """
  def start_game(word) do
    wordMin = String.downcase(word)
    state = %{word: wordMin, missies: [], matches: [], limit: 5, mask: "_"}
    format_response(state)
  end

  @doc """
  This function is for what he user guess the word
  """
  def take_word_user(letter, %{limit: limit} = state) when limit > 0 do
    letter
    |> String.downcase()
    |> guess(state)
    |> format_response()
  end

  def take_word_user(_, state), do: format_response(state)

  defp format_response(%{limit: limit} = state) when limit > 0 do
    {mask_word(state), state}
  end

  defp format_response(%{word: word} = state) do
    {"Game Over, word was: #{word}", state}
  end

  ## Helpers
  defp mask_word(%{matches: [], word: word, mask: mask} = _state) do
    String.replace(word, ~r/./, mask)
  end

  defp mask_word(%{matches: matches, word: word,mask: mask} = _state) do
    matches = Enum.join(matches)
    String.replace(word, ~r/[^#{matches}]/, mask)
  end

  defp guess(letter, state) do
    %{word: word, matches: matches, missies: missies, limit: limit} = state

    if String.contains?(word, letter) do
      %{state | matches: [letter | matches]}
    else
      %{state | missies: [letter | missies], limit: limit - 1}
    end
  end
end
