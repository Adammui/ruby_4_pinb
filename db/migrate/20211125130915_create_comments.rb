class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :advertisement, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
