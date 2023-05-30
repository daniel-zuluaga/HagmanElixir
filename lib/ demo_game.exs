check = fn (attempts) ->
  {_, state} = Hangman.start_game("Hello")

  Enum.reduce(
    attempts,
    state,
    fn (letter, state) ->
      {word, state} = Hangman.take_a_guess(letter, state)
      IO.puts(word)
      state
    end
  )
end

IO.puts("WIN :) !!")
check.(["h", "e", "l", "o"])
IO.puts("Game Over :( !!")
check.(["a", "i", "s", "l", "p", "k", "o"])
