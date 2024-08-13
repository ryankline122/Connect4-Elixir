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
        ["-", "-", "-", "-", "-", "-", "-"]
      ]
      actual = Board.create_board()

      assert(actual == expected)
    end

    test "returns column A as a 1D list" do
      board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]
      expected = ["-","-","-","1", "2", "1"]

      actual = Board.get_column(0, board)

      assert(actual == expected)
    end
  end
end
