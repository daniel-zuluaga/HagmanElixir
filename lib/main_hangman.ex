# {"__________",
# %Hangman.State{
#   word: "#{Goal.generate()}",
#   goal: MapSet.new(["a", "h", "i", "m", "o", "p", "t"]),
#   missies: MapSet.new([]),
#   matches: MapSet.new([]),
#   limit: 5,
#   mask: "_",
#   completed?: false
# }}

# "_______a__"

defmodule Hangman do
  @moduledoc """
  The famous Hagman game
  """
  alias(Hangman.{View, GameLogic, Module.String_Func_Per, Goal})

  @doc """
    Start the game
  """

  @type stateGame() :: map()

  @spec start_link(atom()) :: tuple()
  def start_link(name) when is_atom(name) do
    Agent.start_link(
      fn ->
        Goal.generate()
        |> GameLogic.init_game()
      end,
      name: name
    )
  end

  @doc """
  Valid the letter if the word contains the letter what take in the function

  ## Example
        iex> player = :daniel
        iex> Hangman.start_link(player)
        iex> Hangman.take_a_guess(player, "d")
  """
  @spec take_a_guess(atom() | pid(), String.t()) :: tuple()
  def take_a_guess(player, letter) do
    new_state =
      Agent.get_and_update(player, fn state ->
        new_state =
          letter
          |> String_Func_Per.string_downcase()
          |> GameLogic.guess(state)
        {new_state, new_state}
      end)
      View.format_response(new_state)
  end

  @spec stop(atom()) :: :ok
  def stop(player) when is_atom(player), do: Agent.stop(player)
end
