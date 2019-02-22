class CreateSearchResults < ActiveRecord::Migration[5.2]
  def change
    create_table :search_results do |t|
      t.references :keyword, foreign_key: true
      t.date :search_date

      t.timestamps
    end
  end
end
