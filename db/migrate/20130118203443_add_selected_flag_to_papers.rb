class AddSelectedFlagToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :selected, :boolean, default: false, null: false
  end
end
