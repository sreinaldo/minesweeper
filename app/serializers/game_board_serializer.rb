class GameBoardSerializer < ActiveModel::Serializer
  attributes :id, :rows, :columns, :mines

  has_many :cells
end
