class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_id
      t.string :password_digest    
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
