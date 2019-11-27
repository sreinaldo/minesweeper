class CreateCells < ActiveRecord::Migration[6.0]
  def change
    create_table :cells do |t|
      t.integer :row
      t.integer :column
      t.integer :status
      t.integer :value
      t.integer :play_number
      t.references :game_board, foreign_key: true

      t.timestamps
    end
  end
end
