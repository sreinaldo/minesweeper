require 'test_helper'

class CellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cell = cells(:one)
  end

  test "should get index" do
    get cells_url, as: :json
    assert_response :success
  end

  test "should create cell" do
    assert_difference('Cell.count') do
      post cells_url, params: { cell: { colum: @cell.colum, play_number: @cell.play_number, references: @cell.references, row: @cell.row, status: @cell.status, value: @cell.value } }, as: :json
    end

    assert_response 201
  end

  test "should show cell" do
    get cell_url(@cell), as: :json
    assert_response :success
  end

  test "should update cell" do
    patch cell_url(@cell), params: { cell: { colum: @cell.colum, play_number: @cell.play_number, references: @cell.references, row: @cell.row, status: @cell.status, value: @cell.value } }, as: :json
    assert_response 200
  end

  test "should destroy cell" do
    assert_difference('Cell.count', -1) do
      delete cell_url(@cell), as: :json
    end

    assert_response 204
  end
end
