class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :text,    null: false
      t.date :today,   null: false
      t.integer :time, null: false
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
