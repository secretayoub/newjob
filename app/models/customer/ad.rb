class Customer::Ad < ActiveRecord::Base
  belongs_to :renumeration, :class_name => 'Customer::Renumeration'
  has_many :contract_types, :class_name => 'Customer::ContractType'
end
