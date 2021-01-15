class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :contents
      t.integer :send_id
      t.integer :receive_id

      t.timestamps
    end
  end
end
