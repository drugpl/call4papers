class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers, id: false do |t|
      t.string :id,         null: false
      t.string :email,      null: false
      t.text :bio,          null: false
      t.text :description,  null: false

      t.timestamps
    end
  end
end
