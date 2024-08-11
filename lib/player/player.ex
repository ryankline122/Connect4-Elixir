defmodule Connect4.Player do
  @moduledoc """

  Module for handling player specific logic.

  Functions:
    - take_turn()
    - drop_token()

  """
  alias Connect4.Board
  @players [1, 2]
  @valid_moves ["A", "B", "C", "D", "E", "F", "G"]

  @doc """
  Determines whether or not the provided player is valid.
  """
  @spec valid_player(number()) :: {:ok, [[char()]]} | {:error, String.t()}
  def valid_player(player) when player in @players, do: :ok
  def valid_player(_), do: {:error, "Not a valid player"}

  @doc """
  Asks the current player for a column to place a token into and attempts to update the board.
  :error is returned if input is invalid or board is unable to update.
  """
  @spec take_turn(number(), [[String.t()]]) :: {:ok, [[String.t()]]} | {:error, String.t()}
  def take_turn(player, board \\ []) do
    with :ok <- valid_player(player) do
      IO.puts("Player #{player}'s turn...")
      column = IO.gets("Enter a column: ") |> String.trim()

      drop_token(player, column, board)
    else
      :error -> :error
      error -> error
    end
  end

  @doc """
  Attempts to update the game board in the column selected by the current player
  """
  @spec drop_token(number(), String.t(), [[String.t()]]) :: {:ok, [[String.t()]]} | {:error, String.t()}
  defp drop_token(player, column, board) when column in @valid_moves do
    # TODO: Implement me
    {:ok, Board.create_board}
  end
  defp drop_token(_, _, _), do: {:error, "Column out of range"}
end
