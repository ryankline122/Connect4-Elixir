defmodule Connect4.Board do
  @moduledoc """

  Module for handling board specific logic.

  Functions:
    - create_board()
    - print_board()
    - print_row()
  """

  @doc """
  Creates an empty board.
  """
  @spec create_board() :: [[String.t()]]
  def create_board() do
    [
      ["A", "B", "C", "D", "E", "F", "G"],
      ["-", "-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-", "-"]
    ]
  end

  def print_board([]), do: :ok

  @doc """
  Prints the board to the console with each row on a new line.
  """
  @spec print_board([[String.t()]]) :: :ok
  def print_board([h | t]) do
    print_row(h)
    print_board(t)
  end

  def print_row([]), do: IO.puts("")

  @doc """
  Prints the provided row to the console with followed by a new line.
  """
  @spec print_row([String.t()])
  def print_row([h | t]) do
    IO.write(" #{h} ")
    print_row(t)
  end
end
