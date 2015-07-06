class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :description
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
