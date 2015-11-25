class CreateCustomerContractTypes < ActiveRecord::Migration
  def change
    create_table :customer_contract_types do |t|
      t.string :title
      t.integer :ad_id

      t.timestamps null: false
    end
  end
end
