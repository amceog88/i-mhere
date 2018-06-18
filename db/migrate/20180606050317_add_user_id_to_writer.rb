class AddUserIdToWriter < ActiveRecord::Migration[5.2]
  def change
    add_column :writings, :user_id, :integer
    remove_column :writings, :writer
  end
end
