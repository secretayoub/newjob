ActsAsTaggableOn::Tag.class_eval do
  has_many :ads, through: :taggings, source: :taggable, source_type: 'Customer::Ad'

  update_index 'customer_ads#ad', :self
end

ActsAsTaggableOn::Tagging.class_eval do
  update_index('customer_ads#ad') { taggable if taggable_type == 'Ad' }
end
