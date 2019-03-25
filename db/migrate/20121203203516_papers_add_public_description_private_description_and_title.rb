class PapersAddPublicDescriptionPrivateDescriptionAndTitle < ActiveRecord::Migration[5.2]
  def change
    change_table :papers do |t|
      t.string :title, null: false, default: ''
      t.text :public_description, null: false, default: ''
      t.text :private_description, null: false, default: ''
    end
  end
end
