class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_contact_name
      t.integer :team_phone_nr

      t.timestamps null: false
    end
  end
end
