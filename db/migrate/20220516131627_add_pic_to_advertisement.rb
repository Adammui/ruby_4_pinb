class AddPicToAdvertisement < ActiveRecord::Migration[6.1]
  def change
    add_column :advertisements, :post_pic, :string
  end
end
