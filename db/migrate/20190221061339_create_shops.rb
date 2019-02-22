class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shopname
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
