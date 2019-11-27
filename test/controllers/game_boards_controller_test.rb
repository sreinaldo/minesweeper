require 'test_helper'

class GameBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_board = game_boards(:one)
  end

  test "should get index" do
    get game_boards_url, as: :json
    assert_response :success
  end

  test "should create game_board" do
    assert_difference('GameBoard.count') do
      post game_boards_url, params: { game_board: { columns: @game_board.columns, end_at: @game_board.end_at, mines: @game_board.mines, references: @game_board.references, rows: @game_board.rows, start_at: @game_board.start_at, status: @game_board.status, total_play: @game_board.total_play } }, as: :json
    end

    assert_response 201
  end

  test "should show game_board" do
    get game_board_url(@game_board), as: :json
    assert_response :success
  end

  test "should update game_board" do
    patch game_board_url(@game_board), params: { game_board: { columns: @game_board.columns, end_at: @game_board.end_at, mines: @game_board.mines, references: @game_board.references, rows: @game_board.rows, start_at: @game_board.start_at, status: @game_board.status, total_play: @game_board.total_play } }, as: :json
    assert_response 200
  end

  test "should destroy game_board" do
    assert_difference('GameBoard.count', -1) do
      delete game_board_url(@game_board), as: :json
    end

    assert_response 204
  end
end
