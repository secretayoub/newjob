class Admin < ActiveRecord::Base
  has_one :customer, :class_name => 'Customer::Customer'
  has_many :ads, :class_name => 'Customer::Ad', through: :customer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  def name
    "#{self.customer.company_name}"
  end

  def avatar
    self.customer.avatar
  end
end
