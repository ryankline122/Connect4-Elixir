defmodule Player.PlayerTest do
  use ExUnit.Case
  alias Connect4.Player

  describe "Player.take_turn/1" do
    test "returns {:ok, _msg} if turn completed successfully" do
      result = Player.take_turn(1)
      assert match?({:ok, _}, result)
    end

    test "returns {:error, msg} if given invalid player" do
      result = Player.take_turn(3)
      _msg = result |> elem(1)

      assert match?({:error, _msg}, result)
      assert match?(_msg, "Not a valid player")
    end
  end
end
