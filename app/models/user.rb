class User < ActiveRecord::Base
  has_one :candidat
  has_many :candidat_ads, through: :candidat
  has_many :ads, :class_name => 'Customer::Ad', through: :candidat_ads
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  def name
    "#{self.candidat.name}"
  end

end
