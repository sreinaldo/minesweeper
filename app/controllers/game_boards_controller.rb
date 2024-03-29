class GameBoardsController < ApplicationController
  before_action :set_game_board, only: [:show, :update, :destroy]

  # POST /game_boards
  def create
    @game_board = GameBoard.new(game_board_params)

    if @game_board.save
      render json: @game_board, status: :created, location: @game_board
    else
      render json: @game_board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_boards/1
  def update
    if @game_board.update(game_board_params)
      render json: @game_board
    else
      render json: @game_board.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_board
      @game_board = GameBoard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_board_params
      params.require(:game_board).permit(:columns, :rows, :mines, :user_id)
    end
end
