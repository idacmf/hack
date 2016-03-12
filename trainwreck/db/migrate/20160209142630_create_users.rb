class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer			:user_id  			# User ID, primary key. Every tournament has user_key which points to this.
      t.string 			:first_name 		# First name 
      t.string 			:sur_name			# Surname / last name
      #t.string 			:email				# Email
      t.string 			:p_number 			# Phone number, can add a home number or club number later?
      t.string 			:country			# Country
      t.string 			:city				# City
      t.string			:address			# Address
      t.string 			:username			# Username, default as email
      t.string			:password			# Password, has to be hashed + using a salt
      t.string 			:salt 				# Salting for the passwords
      t.timestamps null: false
    end
  end
end
