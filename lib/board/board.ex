defmodule Connect4.Board do
  @moduledoc """

  Module for handling board specific logic.

  Functions:
    - print()
    - check_for_win()
    - update()
    - is_valid_move()
  """

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

end
