class PapersAddUserId < ActiveRecord::Migration[5.2]
  def up
    add_column :papers, :user_id, :integer, null: false
  end
end
