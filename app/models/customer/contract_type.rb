class Customer::ContractType < ActiveRecord::Base
  belongs_to :ad, :class_name => 'Customer::Ad'
end
