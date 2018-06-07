class AddContactDetailsToRepairs < ActiveRecord::Migration[5.1]
  def change
    add_column :repairs, :contact_name, :string
    add_column :repairs, :contact_telephoneNumber, :string
    add_column :repairs, :contact_emailAddress, :string
    add_column :repairs, :contact_callbackTime, :string
  end
end
