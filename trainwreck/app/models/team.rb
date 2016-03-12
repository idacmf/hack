class Team < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :team_name, presence: true, length: { maximum: MAX_LENGTH_NAME }, uniqueness: { case_sensitive: false }
  #so far no mechanism for case sensitivity on db level
  validates :team_contact_name, presence: true, length: { maximum: MAX_LENGTH_NAME }
  validates :team_phone_nr, length: { minimum: 8, maximum: 8 }
  validates :user_id, presence: true
end
