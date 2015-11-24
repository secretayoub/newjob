class AddMyCvToCandidat < ActiveRecord::Migration
  def self.up
    add_attachment :candidats, :my_cv
  end

  def self.down
    remove_attachment :candidats, :my_cv
  end
end
