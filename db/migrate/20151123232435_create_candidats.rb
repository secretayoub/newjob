class CreateCandidats < ActiveRecord::Migration
  def change
    create_table :candidats do |t|
      t.string :name
      t.string :phone_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
