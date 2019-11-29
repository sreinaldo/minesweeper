class GameBoard < ApplicationRecord
  belongs_to :user
  has_many :cells

  after_create :create_board


  def create_board
    cells = init_board(self.rows, self.columns)
    cells = add_mines(self.rows, self.columns, self.mines, cells)
    print(cells)
    create_cells(cells, self.id)
  end

  def init_board(rows, cols)
    cells = Array.new(rows) {Array.new(cols, 0)}
    rows.times do |x|
      cols.times do |y|
        cells[x][y] = 0
      end
    end

    cells
  end

  def add_mines(rows, cols, mines, cells)
    mines.times do
      col = row = 0
      loop do
        col = rand(cols)
        row = rand(rows)
        break if cells[row][col] != 9
      end
      cells[row][col] = 9
      cells = add_number_around_mine(row, col, rows, cols, cells)
    end

    cells
  end

  def add_number_around_mine(mine_row, mine_col, max_row, max_col, cells)
    x = [0, mine_row - 1].max
    while x <= [max_row - 1, mine_row + 1].min
      y = [0, mine_col - 1].max
      while y <= [max_col - 1, mine_col + 1].min
        if cells[x][y] != 9
          cells[x][y] += 1
        end
        y += 1
      end
      x += 1
    end

    cells
  end

  def create_cells(cells, game_board_id)
    cells.each_with_index do |item, row|
      cells[row].each_with_index do |item, col|
        Cell.create!(row: row,
                     column: col,
                     status: :close,
                     value: cells[row][col],
                     game_board_id: game_board_id)
      end
    end
  end
end
