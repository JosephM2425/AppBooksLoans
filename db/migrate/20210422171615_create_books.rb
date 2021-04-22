class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.string :publisher, null: false
      t.integer :edition, default: 1
      t.string :isbn, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
