class Match < ActiveRecord::Base
  belongs_to :tournament
  has_many :teams
end
