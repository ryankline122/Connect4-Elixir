defmodule Connect4 do
alias Connect4.Board
alias Connect4.Player

  @spec main(any()) :: nil
  def main(_args) do
    play(1, Board.create_board())
  end

  def play(current_player, board, winner \\ 0)
  def play(current_player, board, winner) when winner > 0, do: winner
  def play(current_player, board, 0) do
    Board.print_board(board)

    result = Player.take_turn(current_player, board)

    if elem(result, 0) == :ok do
      current_player = if current_player == 1 do 2 else 1 end
      board = elem(result, 1)
      play(current_player, board)
    else
      IO.puts(elem(result, 1))
      IO.puts("Try again...")
      play(current_player, board)
    end
  end
end
