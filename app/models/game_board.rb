class GameBoard < ApplicationRecord
  belongs_to :user
  has_many :cells

end
