class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false
      t.string :current_motorcycle
      t.text :motorcycle_history
      t.string :dream_motorcycle
      t.text :fav_touring_routes
      t.text :other_hobbies
      t.text :message
      t.references :user

      t.timestamps
    end
  end
end
