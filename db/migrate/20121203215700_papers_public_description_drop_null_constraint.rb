class PapersPublicDescriptionDropNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column :papers, :public_description, :text, null: true
  end
end
