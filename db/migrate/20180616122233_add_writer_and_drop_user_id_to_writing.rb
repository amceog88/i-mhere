class AddWriterAndDropUserIdToWriting < ActiveRecord::Migration[5.2]
  def change
    add_column :writings, :writer, :string
    remove_column :writings, :user_id
  end
end
