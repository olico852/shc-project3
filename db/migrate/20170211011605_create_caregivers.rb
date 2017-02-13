class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :gender
      t.string :certification
      t.string :languages
      t.string :specialities
      t.integer :yearsofexperience
      t.text :experiencedescription
      t.string :photo

      t.timestamps
    end
  end
end
