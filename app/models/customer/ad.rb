class Customer::Ad < ActiveRecord::Base
  acts_as_taggable

  belongs_to :renumeration, :class_name => 'Customer::Renumeration'
  belongs_to :customer, :class_name => 'Customer::Customer'
  has_many :contract_types, :class_name => 'Customer::ContractType'
  has_many :candidat_ads
  has_many :candidats, through: :candidat_ads

  update_index 'customer_ads#ad', :self


end
