defmodule HangmanTest do
  use ExUnit.Case
  doctest(Hangman)

  describe "take_a_guess/2" do
    setup do
      {"_______", state} = Hangman.start_game("hangman")

      %{state: state}
    end

    test "Probar el caso si el player gana", %{state: state} do
      assert({"_a___a_", _state} = Hangman.take_a_guess("a", state))

      {result, state} = check(["h", "g", "n", "m", "a"], state)

      assert "You won, word was: hangman" == result
      assert state.completed?
    end

    test "Probar el caso si el player pierde", %{state: state} do
      assert({"_______", state} = Hangman.take_a_guess("z", %{state | limit: 2}))
      assert({"Game Over, word was: hangman", state} = Hangman.take_a_guess("w", state))
      refute state.completed?
    end

    defp check(attempts, state) do
      Enum.reduce(
        attempts,
        {"", state},
        fn letter, {_, state} ->
          Hangman.take_a_guess(letter, state)
        end
      )
    end
  end
end
