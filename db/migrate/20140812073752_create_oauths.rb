class CreateOauths < ActiveRecord::Migration
  def up
    create_table :oauths do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :image

      t.timestamps
    end
  end

  def down
    drop_table :oauths
  end
end
