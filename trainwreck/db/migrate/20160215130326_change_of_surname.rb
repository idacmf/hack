class ChangeOfSurname < ActiveRecord::Migration
  def change
    rename_column :users, :sur_name, :surname
  end
end
