class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :home_page_url
      t.string :communication_url
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
