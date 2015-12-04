class Customer::Ad < ActiveRecord::Base
  acts_as_taggable

  belongs_to :renumeration, :class_name => 'Customer::Renumeration'
  belongs_to :customer, :class_name => 'Customer::Customer'
  has_many :candidat_ads
  has_many :candidats, through: :candidat_ads
  has_many :contract_type_ads, :class_name => 'Customer::ContractTypeAd'
  has_many :contract_types, through: :contract_type_ads


  update_index 'customer_ads#ad', :self


end
