class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string   :title
      t.string   :genre
      t.float    :rating
      t.boolean  :available

      t.timestamps
    end
  end
end
