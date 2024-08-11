defmodule Player.PlayerTest do
  use ExUnit.Case
  alias Connect4.Board
  alias Connect4.Player

  import Mock
  import Connect4.Board

  # Couldn't figure out how to get setup to work. Maybe come back to this?
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
        ["-", "-", "-", "-", "-", "-", "-"],
        ["1", "-", "-", "-", "-", "-", "-"]
      ]

      result = Player.take_turn(1, @context.board)
      received_board = result |> elem(1)

      assert match?({:ok, _}, result)
      assert received_board == expected_board
    end

    test "returns {:error, msg} if given invalid player" do
      result = Player.take_turn(3)
      _msg = result |> elem(1)

      assert match?({:error, _msg}, result)
      assert match?(_msg, "Not a valid player")
    end
  end
end
