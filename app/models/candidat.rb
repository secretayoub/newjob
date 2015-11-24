class Candidat < ActiveRecord::Base
  belongs_to :user

  has_attached_file :my_cv
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment :my_cv , content_type: { content_type: "application/pdf" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
