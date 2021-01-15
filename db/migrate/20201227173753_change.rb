class Change < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :content, :string
    remove_column :messages, :contents, :string
  end
end
