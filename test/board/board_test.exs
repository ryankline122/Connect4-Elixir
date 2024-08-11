defmodule Board.BoardTest do
  use ExUnit.Case

  alias Connect4.Board

  describe "Board" do
    test "Board.create_board/0 should return empty board" do
      expected = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"]
      ]
      actual = Board.create_board()

      assert(actual == expected)
    end
  end
end
