class Cell < ApplicationRecord
  belongs_to :game_board

  enum status: { closed: 0, opened: 1, flagged: 2}

  scope :by_row_column, lambda {
    order(row: :asc, column: :asc)
  }

  scope :opened, lambda {
    where(status: :opened)
  }

  def self.open_cell(cell, flagged=false)
    puts(cell.status)
    if flagged && cell.closed?
      cell.flagged!
      return nil
    elsif cell.closed?
      cell.status = :opened
      cell.save
      if cell.value == 0
        x = [0, cell.row - 1].max
        while x <= [cell.game_board.rows - 1, cell.row + 1].min
          y = [0, cell.column - 1].max
          while y <= [cell.game_board.columns - 1, cell.column + 1].min
            puts(x)
            puts(y)
            next_cell = Cell.where(game_board_id: cell.game_board_id, row: x, column: y).first
            if next_cell.value < 9
              open_cell(next_cell)
            end
            y += 1
          end
          x += 1
        end
      end
    end
  end
end

