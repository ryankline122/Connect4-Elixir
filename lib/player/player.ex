defmodule Connect4.Player do
  @moduledoc """

  Module for handling player specific logic.

  Functions:
    - take_turn()
    - drop_token()

  """
  @players [1, 2]

  @spec valid_player(number()) :: :ok | {:error, String.t()}
  def valid_player(player) when player in @players, do: :ok
  def valid_player(_), do: {:error, "Not a valid player"}

  @spec take_turn(number()) :: {:ok, String.t()} | {:error, String.t()}
  def take_turn(player) do
    with :ok <- valid_player(player) do
      IO.puts("Player #{player}'s turn.")
      column = IO.gets("Enter a colum:") |> String.trim()

      # TODO: validate input, implement 'drop_token'

      {:ok, _msg} = {:ok, "Implement me!"}
    else
      :error -> :error
      error -> error
    end
  end
end
