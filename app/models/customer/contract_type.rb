class Customer::ContractType < ActiveRecord::Base
  has_many :contract_type_ads, :class_name => 'Customer::ContractTypeAd'

end
