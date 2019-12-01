class CreateGameBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :game_boards do |t|
      t.integer :columns, null: false
      t.integer :rows, null: false
      t.integer :mines, null: false
      t.datetime :start_at, default: DateTime.now()
      t.datetime :end_at
      t.integer :total_plays, default: 0
      t.integer :status, default: 0
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
