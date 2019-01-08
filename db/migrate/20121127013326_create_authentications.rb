class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
