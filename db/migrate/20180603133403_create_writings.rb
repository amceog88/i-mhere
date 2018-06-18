class CreateWritings < ActiveRecord::Migration[5.2]
  def change
    create_table :writings do |t|
      t.string :writer
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
