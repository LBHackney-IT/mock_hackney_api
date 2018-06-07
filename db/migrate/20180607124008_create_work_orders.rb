class CreateWorkOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :work_orders do |t|
      t.string :workOrderReference
      t.string :sorCode
      t.string :supplierRef
      t.references :repair, foreign_key: true

      t.timestamps
    end
  end
end
