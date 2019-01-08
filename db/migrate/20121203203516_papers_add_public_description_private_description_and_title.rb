class PapersAddPublicDescriptionPrivateDescriptionAndTitle < ActiveRecord::Migration[5.2]
  def change
    change_table :papers do |t|
      t.string :title, null: false
      t.text :public_description, null: false
      t.text :private_description, null: false
    end
  end
end
