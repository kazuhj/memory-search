class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :text
      t.text :title, null: false
      t.string :image
      t.references :user, null:false, foreign_key: true
      t.references :group, null:false, foreign_key: true
      t.timestamps
    end
  end
end
