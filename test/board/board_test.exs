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

    test "adds token to next open cell in column" do
      initial = ["-", "-", "-", "-", "2", "1"]
      expected = ["-", "-", "-", "1", "2", "1"]

      actual = Board.update_column(1, initial)

      assert actual == expected
    end

    test "replaces column in board at index 0" do
      board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]
      updated_col = ["A", "-", "-", "2", "1", "2", "1"]

      expected = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]

      actual = Board.replace_column(0, updated_col, board)

      assert(actual == expected)
    end
  end
end
