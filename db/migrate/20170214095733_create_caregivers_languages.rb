class CreateCaregiversLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers_languages do |t|
      t.references :caregiver, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
