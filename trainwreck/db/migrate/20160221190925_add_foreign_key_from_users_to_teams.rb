class AddForeignKeyFromUsersToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :user, index: true, foreign_key: true
    #add_index :teams, [:user_id, :created_at] #Uncomment if the multi-index is needed
  end
end
