class CreateCandidatAds < ActiveRecord::Migration
  def change
    create_table :candidat_ads do |t|
      t.integer :candidat_id
      t.integer :ad_id

      t.timestamps null: false
    end
  end
end
