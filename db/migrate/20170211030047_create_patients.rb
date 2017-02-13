class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.belongs_to :fammember, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :gender
      t.string :frequency
      t.text :condition_description

      t.timestamps
    end
  end
end
