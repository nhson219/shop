class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|

      t.string :name
      t.string :description
      t.string :content
      t.boolean :display

      t.timestamps null: false
    end
  end
end
