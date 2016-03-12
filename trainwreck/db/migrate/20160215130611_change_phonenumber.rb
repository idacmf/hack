class ChangePhonenumber < ActiveRecord::Migration
  def change
    rename_column :users, :p_number, :phone_number
  end
end
