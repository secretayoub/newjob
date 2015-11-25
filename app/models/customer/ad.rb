class Customer::Ad < ActiveRecord::Base
  belongs_to :renumeration, :class_name => 'Customer::Renumeration'
  belongs_to :customer, :class_name => 'Customer::Customer'
  has_many :contract_types, :class_name => 'Customer::ContractType'

  acts_as_taggable
end