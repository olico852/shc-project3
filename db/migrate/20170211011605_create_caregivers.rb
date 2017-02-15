class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :gender
      t.boolean :certification
      t.integer :yearsofexperience
      t.text :experiencedescription
      t.string :photo

      t.timestamps
    end
  end
end
