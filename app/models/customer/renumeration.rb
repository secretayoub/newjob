class Customer::Renumeration < ActiveRecord::Base
  has_one :ad, :class_name => 'Customer::Ad'
end
