class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :work_order, foreign_key: true
      t.string :sorCode
      t.datetime :dueDate
      t.string :supplierReference
      t.decimal :estimatedCost
      t.string :trade
      t.datetime :completedDate
      t.text :description

      t.timestamps
    end
  end
end
