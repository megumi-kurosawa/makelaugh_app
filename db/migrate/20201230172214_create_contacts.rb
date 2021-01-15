class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :send_id
      t.integer :receive_id

      t.timestamps
    end
  end
end
