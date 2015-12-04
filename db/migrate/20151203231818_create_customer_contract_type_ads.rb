class CreateCustomerContractTypeAds < ActiveRecord::Migration
  def change
    create_table :customer_contract_type_ads do |t|
      t.integer :ad_id
      t.integer :contract_type_id


      t.timestamps null: false
    end
    remove_column :customer_contract_types, :ad_id
  end
end
