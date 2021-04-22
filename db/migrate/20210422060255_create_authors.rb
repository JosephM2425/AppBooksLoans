class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :fullName, null: false
      t.text :description
      t.string :country

      t.timestamps
    end
  end
end
