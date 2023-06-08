defmodule HangmanTest do
  use ExUnit.Case
  doctest(Hangman)

  defmodule Module.Test_Generator do
    @behaviour Hangeman.Goal.Api

    def generate, do: "hangman"
  end

  describe "take_a_guess/2" do
    setup do
      player = :daniel

      Hangman.start_link(player)
    end

    test "Probar el caso si el player gana"  do
      player = :daniel

      assert({"_a___a_", _pid} = Hangman.take_a_guess(player, "a"))

      {result, pid} = check(["h", "g", "n", "m", "a"], player)

      assert "You won, word was: hangman" == result
      assert pid.completed?
    end

    test "Probar el caso si el player pierde" do
      player = :daniel

      assert({"_______", pid} = Hangman.take_a_guess(player, "z"))
      assert({"Game Over, word was: hangman", pid} = Hangman.take_a_guess(player, "x"))
      refute pid.completed?
    end

    defp check(attempts, name) do
      Enum.reduce(
        attempts,
        {"", name},
        fn letter, {_, name} ->
          Hangman.take_a_guess(name, letter)
        end
      )
    end
  end
end
