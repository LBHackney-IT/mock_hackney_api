class RenameSupplierReference < ActiveRecord::Migration[5.1]
  def change
    rename_column :work_orders, :supplierRef, :supplierReference
  end
end
