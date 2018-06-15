class AddBlockInfoToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :type, :string
    add_column :properties, :managerName, :string
    add_column :properties, :managerPhone, :string
    add_column :properties, :managerEmail, :string
    add_column :properties, :floors, :integer
    add_column :properties, :entranceDoors, :integer
    add_column :properties, :lifts, :integer
    add_column :properties, :heating, :string
    add_column :properties, :parentReference, :string
  end
end
