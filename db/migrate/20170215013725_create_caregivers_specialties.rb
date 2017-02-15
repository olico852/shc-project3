class CreateCaregiversSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers_specialties do |t|
      t.references :caregiver, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
