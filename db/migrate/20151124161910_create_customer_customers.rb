class CreateCustomerCustomers < ActiveRecord::Migration
  def change
    create_table :customer_customers do |t|
      t.string :company_name
      t.string :company_description
      t.string :city
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
