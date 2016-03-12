
class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|   # Did not add: Teams (foreign key, not sure where thats meant to go.), changed private to type, and did not add matches.
      t.string   :name    # Name of tournament
      t.integer  :user_id  # Host ID, foreign key to the users models -> user_id
      t.integer  :status   # Status of the tornament
      t.string   :location   # Location of Tournament
      t.integer  :type    # Private or public, can add more at a later point.
      t.string  :time_start  # Time start in UNIX timestamp.
      t.string  :time_end   # Time end in UNIX timestamp.
      t.string  :time_start_act # Active time start in UNIX timestamp
      t.string  :time_end_act  # Active time start in UNIX timestamp
      t.integer  :max_teams  # Max teams in tournament, -1 if no limit ?
      t.timestamps null: false
    end
  end
end