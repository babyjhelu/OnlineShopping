class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :available_sizes
      t.string :available_colors

      t.timestamps
    end
  end
end
