defmodule Player.PlayerTest do
  use ExUnit.Case
  alias Connect4.Board
  alias Connect4.Player

  import Mock

  @context %{
    board: Board.create_board()
  }

  describe "Player.take_turn/2" do
    test_with_mock "return {:ok, board} if turn completed successfully",
    IO, [
      gets: fn(_) -> "A" end,
      puts: fn(_) -> "Player 1's turn" end
    ] do
      expected_board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]

      result = Player.take_turn(1, @context.board)
      received_board = result |> elem(1)

      assert match?({:ok, _}, result)
      assert received_board == expected_board
    end


    test_with_mock "return expected board state after 2 turns in same column",
    IO, [
      gets: fn(_) -> "A" end,
      puts: fn(_) -> "Player's turn" end
    ] do
      expected_board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]

      result = Player.take_turn(1, @context.board)
      result = Player.take_turn(2, elem(result, 1))
      received_board = result |> elem(1)

      assert match?({:ok, _}, result)
      assert received_board == expected_board
    end

    test_with_mock "return error when attempting to place token in full column",
    IO, [
      gets: fn(_) -> "A" end,
      puts: fn(_) -> "Player's turn" end
    ] do
      initial_board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"],
        ["2", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]

      result = Player.take_turn(1, initial_board)

      assert match?({:error, "Invalid move: Column full"}, result)
    end

    test_with_mock "returns error when invalid column is provided",
    IO, [
      gets: fn(_) -> "H" end,
      puts: fn(_) -> "Player's turn" end
    ] do
      result = Player.take_turn(1, @context.board)

      assert match?({:error, "Invalid move: Column out of range"}, result)
    end

    test "returns {:error, msg} if given invalid player" do
      result = Player.take_turn(3)
      _msg = result |> elem(1)

      assert match?({:error, _msg}, result)
      assert match?(_msg, "Not a valid player")
    end
  end


  describe "Player.drop_token/3" do
    test "return expected board state after multiple turns in same row" do
      expected_board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["1", "2", "1", "2", "1", "2", "1"]
      ]

      {_, result} = Player.drop_token(1, "A", @context.board)
      {_, result} = Player.drop_token(2, "B", result)
      {_, result} = Player.drop_token(1, "C", result)
      {_, result} = Player.drop_token(2, "D", result)
      {_, result} = Player.drop_token(1, "E", result)
      {_, result} = Player.drop_token(2, "F", result)
      {_, result} = Player.drop_token(1, "G", result)
      received_board = result

      assert received_board == expected_board
    end

    test "return expected board state after multiple turns in various rows/columns" do
      expected_board = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-", "-"],
        ["-", "-", "2", "-", "-", "-", "-"],
        ["-", "1", "1", "-", "-", "-", "-"],
        ["1", "2", "2", "-", "-", "-", "-"]
      ]

      {_, result} = Player.drop_token(1, "A", @context.board)
      {_, result} = Player.drop_token(2, "B", result)
      {_, result} = Player.drop_token(1, "B", result)
      {_, result} = Player.drop_token(2, "C", result)
      {_, result} = Player.drop_token(1, "C", result)
      {_, result} = Player.drop_token(2, "C", result)
      received_board = result

      assert received_board == expected_board
    end
  end
end
