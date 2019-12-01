class CellsController < ApplicationController
  # POST /cell/click
  def click
    cell = Cell.find(params[:cell_id])

    Cell.open_cell(cell, params[:flagged])
    GameBoard.refresh_status(cell)
    cell.reload

    render json: cell.game_board
  end
end
