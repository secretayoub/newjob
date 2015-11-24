class AddAvatarToCandidat < ActiveRecord::Migration
  def self.up
    add_attachment :candidats, :avatar
  end

  def self.down
    remove_attachment :candidats, :avatar
  end
end
