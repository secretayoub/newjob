class Customer::ContractTypeAd < ActiveRecord::Base
  belongs_to :contract_type,  :class_name => 'Customer::ContractType'
  belongs_to :ad, :class_name =>  'Customer::Ad'
end
