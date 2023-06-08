defmodule Hangman.Goal.Word_Generator do
  @behaviour Hangman.Goal.Api

  alias Hangman.Modules.ListWordsGenerator

  def generate() do
    words = ListWordsGenerator.wordGenerator()
    Enum.random(words)
  end
end
