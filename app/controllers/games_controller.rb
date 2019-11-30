class GamesController < ApplicationGameController
  def index
    @game_board = GameBoard.find(16)
    @game_rows = [*0..@game_board.rows - 1]
    @game_board_cells = @game_board.cells.by_row_column
  end
end
