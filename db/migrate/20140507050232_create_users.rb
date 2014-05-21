class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :address
      t.string :city
      t.integer :pincode
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
