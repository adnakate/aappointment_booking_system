class CreateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :email
      t.references :time_zone, null: false, foreign_key: true
      t.timestamps
    end
  end
end
