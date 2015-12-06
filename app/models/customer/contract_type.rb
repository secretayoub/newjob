class Customer::ContractType < ActiveRecord::Base
  has_many :contract_type_ads, :class_name => 'Customer::ContractTypeAd'

  update_index 'customer_ads#contract_types' , :self
end
