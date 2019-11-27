class Cell < ApplicationRecord
  belongs_to :game_board

  enum status: { close: 0, open: 1, flag: 2}

end
