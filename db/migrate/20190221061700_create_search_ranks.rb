class CreateSearchRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :search_ranks do |t|
      t.references :search_result, foreign_key: true
      t.integer :rank
      t.string :shopname

      t.timestamps
    end
  end
end
