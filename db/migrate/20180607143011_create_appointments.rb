class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :beginDate
      t.datetime :endDate
      t.references :work_order, foreign_key: true

      t.timestamps
    end
  end
end
