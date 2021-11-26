class AddImageToAdvertisements < ActiveRecord::Migration[6.1]
  def change
    add_column :advertisements, :image, :string
  end
end
