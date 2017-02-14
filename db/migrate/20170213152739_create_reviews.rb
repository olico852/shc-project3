class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment

      t.references :caregiver, foreign_key: true
      t.references :fammember, foreign_key: true
      t.references :reviewable, polymorphic: true

      t.timestamps
    end
  end
end
