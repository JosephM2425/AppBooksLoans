class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
