class CreateCloths < ActiveRecord::Migration[5.2]
  def change
    create_table :cloths do |t|
      t.references :user
      t.string :name
      t.references :category
      t.references :color
      t.string :memo
      t.string :image_cloth

      t.timestamps
    end
  end
end
