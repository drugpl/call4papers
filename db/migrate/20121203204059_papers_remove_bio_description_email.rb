class PapersRemoveBioDescriptionEmail < ActiveRecord::Migration[5.2]
  def change
    change_table :papers do |t|
      t.remove :description, :bio, :email
    end
  end
end
