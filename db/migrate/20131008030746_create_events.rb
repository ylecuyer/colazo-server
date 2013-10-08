class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.timestamp :when
      t.string :where

      t.timestamps
    end
  end
end
