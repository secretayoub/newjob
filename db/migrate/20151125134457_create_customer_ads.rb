class CreateCustomerAds < ActiveRecord::Migration
  def change
    create_table :customer_ads do |t|
      t.string :title
      t.integer :ad_number, default: 0
      t.integer :renumeration_id
      t.text :ad_text
      t.text :profil
      t.text :mission
      t.string :advantage
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
