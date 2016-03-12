class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.integer 	:match_id 				# Match ID, primary key
    	t.integer 	:team_1 				# ID of team 1, foreign key into the teams model.
    	t.integer 	:team_2					# ID of team 2, foreign key into the teams model.
    	t.integer 	:team_1_score			# Score of team 1
    	t.integer 	:team_2_score			# Score of team 2
    	t.integer 	:winner					# ID of winner, foreign key into the teams model.
    	t.integer 	:loser					# ID of loser, foreign key into the teams model.
    	t.integer 	:time 					# Unix timestamp of time
    	t.string 	:location				# Location
    	t.integer 		:t_id					# Torunament ID, foreign key into the tournaments model.
      	t.timestamps null: false
    end
  end
end
