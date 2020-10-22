class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.string :region, null: false
      t.integer :prefecture_id, null: false
      t.string :meeting_point, null: false
      t.text :details, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
