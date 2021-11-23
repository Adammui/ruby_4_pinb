class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :full_name
      t.date :birthday
      t.string :email
      t.string :adress
      t.string :state
      t.string :city
      t.string :country
      t.string :zip
      t.integer :password
      t.integer :password_confirm

      t.timestamps
    end
  end
end
