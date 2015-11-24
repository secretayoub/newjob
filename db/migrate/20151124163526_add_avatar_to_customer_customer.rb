class AddAvatarToCustomerCustomer < ActiveRecord::Migration
  def self.up
    add_attachment :customer_customers, :avatar
  end

  def self.down
    remove_attachment :customer_customers, :avatar
  end
end
