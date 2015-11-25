class CreateCustomerRenumerations < ActiveRecord::Migration
  def change
    create_table :customer_renumerations do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
