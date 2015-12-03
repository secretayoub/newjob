class Customer::Customer < ActiveRecord::Base
  belongs_to :admin
  has_many :ads, :class_name => 'Customer::Ad'


  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
