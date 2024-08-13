defmodule Connect4.Board do
  @moduledoc """

  Module for handling board specific logic.

  Functions:
    - create_board()
    - print_board()
    - print_row()
    - get_column()
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
  @spec print_row([String.t()]) :: :ok
  def print_row([h | t]) do
    IO.write(" #{h} ")
    print_row(t)
  end


  def get_column(col, board, curr_col \\ 0, accum \\ [])

  def get_column(_, [], _, accum), do: tl(Enum.reverse(accum))

  def get_column(col, board, curr_col, _) when curr_col < col do
    reduced_board = for row <- board, do: tl(row)
    get_column(col, reduced_board, curr_col + 1)
  end

  @doc """
  Retrieves the requested column as a 1 dimensional list.
  """
  @spec get_column(number(), [[String.t()]], number(), [String.t()]) :: [any()]
  def get_column(col, [h | t], curr_col, accum) do
    get_column(col, t, curr_col, [hd(h) | accum])
  end
end
