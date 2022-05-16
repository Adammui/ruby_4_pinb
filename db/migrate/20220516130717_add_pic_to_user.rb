class AddPicToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_pic, :string
  end
end
