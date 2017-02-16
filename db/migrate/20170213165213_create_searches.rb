class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :languages
      t.string :specialties
      t.integer :yearsofexperience
      t.string :gender

      t.timestamps
    end
  end
end
