class AddMetadataToWorkOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :estimatedCost, :decimal
    add_column :work_orders, :repairType, :string
    add_column :work_orders, :status, :string
    add_column :work_orders, :dueDate, :datetime
    add_column :work_orders, :expectedCompletion, :datetime
    add_column :work_orders, :attendedDate, :datetime
    add_column :work_orders, :attendedBy, :string
    add_column :work_orders, :outcome, :string
    add_column :work_orders, :cancelledDate, :string
  end
end
