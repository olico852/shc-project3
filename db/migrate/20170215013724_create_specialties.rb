class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.string :ability

      t.timestamps
    end
  end
end
