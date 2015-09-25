class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :name
      t.text :description
      t.text :content
      t.boolean :display

      t.timestamps null: false
    end
  end
end
