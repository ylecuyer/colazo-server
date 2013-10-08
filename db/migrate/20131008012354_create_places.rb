class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :category

      t.timestamps
    end
  end
end
