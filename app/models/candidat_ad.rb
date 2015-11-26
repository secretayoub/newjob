class CandidatAd < ActiveRecord::Base
  belongs_to :candidat
  belongs_to :ad, :class_name => 'Customer::Ad'
end
