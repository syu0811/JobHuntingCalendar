class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.string :url
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
