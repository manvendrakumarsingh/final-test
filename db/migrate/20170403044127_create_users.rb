class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date   :dob
      t.string :phone_number
      t.string :country
      t.string :address
      t.string :state
      t.integer :zip_code
      t.boolean :kids       
      t.string :email
      t.string :password_digest
      t.string :user_role

      t.timestamps
    end
  end
end
