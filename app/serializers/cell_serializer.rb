class CellSerializer < ActiveModel::Serializer
  attributes :id, :game_board_id, :row, :column, :status, :value

  def value
    if object.closed? || object.flagged?
      return ''
    else
      return object.value
    end
  end
end
