class AddBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :deposits do |t|
      t.integer :user_id, null: false
      t.integer :to_user_id, null: false
      t.integer :amount, null: false
      t.string :comment
      t.timestamps
    end

    add_foreign_key :chat_messages, :users
    add_foreign_key :chat_messages, :users, column: :to_user_id
  end
end
