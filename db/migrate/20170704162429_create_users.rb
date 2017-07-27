class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :encrypted_password, null: false
      t.boolean :admin, null: false
    end

    add_column :users, :created_at, :timestamptz
    change_column :users, :created_at, :timestamptz, null: false
  end
end
