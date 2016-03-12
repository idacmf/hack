class AddIndexToTeamsTeamName < ActiveRecord::Migration
  def change
    add_index :teams, :team_name, unique: true  #Should consider how to enforce case insensitivity at the db level.
  end
end
