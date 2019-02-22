class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.references :shop, foreign_key: true
      t.string :keyword
      t.text :url

      t.timestamps
    end
  end
end
