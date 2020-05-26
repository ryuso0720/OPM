class CreatePersonals < ActiveRecord::Migration[5.2]
  def change
    create_table :personals do |t|
      t.references :user, null:false
      t.text :profile
      t.string :icon_image

      t.timestamps
    end
  end
end
