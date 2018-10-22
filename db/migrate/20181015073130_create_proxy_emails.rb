class CreateProxyEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :proxy_emails do |t|
      t.string :email
      t.integer :user_id
      t.timestamps
    end
  end
end
