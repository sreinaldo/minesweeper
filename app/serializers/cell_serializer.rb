class CellSerializer < ActiveModel::Serializer
  attributes :id, :game_board_id, :row, :column, :status, :value

  # def opened_cells
  #   self.object.open_closed_cells
  #
  # end
end
