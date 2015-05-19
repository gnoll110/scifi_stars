class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.string :url_real
      t.string :url_scifi
      t.string :constellation
      t.string :distance

      t.timestamps null: false
    end
  end
end
