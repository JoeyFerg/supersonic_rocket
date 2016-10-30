class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.decimal :price, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
