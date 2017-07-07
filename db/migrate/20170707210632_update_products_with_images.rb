class UpdateProductsWithImages < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.column :image, :string
    end
  end
end
