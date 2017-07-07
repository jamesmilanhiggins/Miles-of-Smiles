class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :price, :integer
      t.column :user_id, :integer
    end
  end

  def self.up
    change_table :products do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :products, :avatar
  end
end
