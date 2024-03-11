class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.references :time_slot, foreign_key: true
      t.timestamps
    end
  end
end
