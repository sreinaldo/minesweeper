class GameBoardSerializer < ActiveModel::Serializer
  attributes :id, :rows, :columns, :mines, :status

  has_many :cells
end
