class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.text :description
      t.text :content
      t.string :image
      t.integer :author_id
      t.boolean :display

      t.timestamps null: false
    end
  end
end
