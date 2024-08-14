defmodule Connect4.Board do
  @moduledoc """

  Module for handling board specific logic.

  Functions:
    - create_board()
    - print_board()
    - print_row()
    - get_column()
    - get_column_number()
    - update_column()
    - replace_column()
  """

  @labels %{
    "A" => 0,
    "B" => 1,
    "C" => 2,
    "D" => 3,
    "E" => 4,
    "F" => 5,
    "G" => 6,
  }

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

  @doc """
  Returns the column label as the appropriate index.
  """
  @spec get_column_number(String.t()) :: number()
  def get_column_number(label) do
    @labels[label]
  end

  def update_column(player, col, updated \\ false, accum \\ [])
  def update_column(_, [], _, accum), do: accum |> Enum.reverse()
  def update_column(player, [h | t], updated, accum) when updated == false do
    next = if t == [] do [] else hd(t) end
    if next == "-" do
      update_column(player, t, false, [h | accum])
    else
      update_column(player, t, true, [Integer.to_string(player) | accum])
    end
  end

  @doc """
  Given a column and a player number, this function will return a new column
  with the player token in the next available slot.

  ## Example
    update_column(2, ["-", "-", "-", "1"])) returns ["-", "-", "2", "1"]
  """
  @spec update_column(number(), [String.t()], boolean(), [String]) :: [String.t()]
  def update_column(player, [h | t], true, accum) do
    update_column(player, t, true, [h | accum])
  end

  def replace_column(col_num, new_col, board, curr_row \\ 0, accum \\ [])
  def replace_column(_, _, [], _, accum), do: accum |> Enum.reverse()
  def replace_column(col_num, [col_h | col_t], [board_h | board_t], curr_row, accum) when curr_row > 0 do
    row = List.replace_at(board_h, col_num, col_h)
    replace_column(col_num, col_t, board_t, curr_row + 1, [row | accum])
  end

  @doc """
  Replaces a column in the board at the provided index. Returns updated board.
  """
  @spec replace_column(number(), [String.t()], [[String.t()]], number(), [[String.t()]]) :: [[String.t()]]
  def replace_column(col_num, new_col, [h | t], curr_row, accum) do
    replace_column(col_num, tl(new_col), t, curr_row + 1, [h | accum])
  end
end
