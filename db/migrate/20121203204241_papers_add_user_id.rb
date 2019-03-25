class PapersAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :user_id, :integer
    change_column :papers, :user_id, :integer, null: false
  end
end
