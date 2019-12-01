class CellSerializer < ActiveModel::Serializer
  attributes :id, :game_board_id, :row, :column, :status, :value
end
