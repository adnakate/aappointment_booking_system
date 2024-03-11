class CreateWeeklySchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_schedules do |t|
      t.references :coach, null: false, foreign_key: true
      t.integer :day_of_week
      t.string :available_at
      t.string :available_until
      t.timestamps
    end
  end
end
