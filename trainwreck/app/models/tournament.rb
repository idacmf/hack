class Tournament < ActiveRecord::Base
  has_many :matches

  validates :name, :max_teams, presence: true
  validate :date_error

  def date_error
    if time_end < time_start
      errors.add(:time_end, "cannot happen before Time start")

      #Comment in when rspec can choose dropdown
      #elsif time_end == time_start
      #errors.add(:time_end, "cannot be the same as Time start")
    end
  end

  def self.search(search)
      where("name = ?", "#{search}")
  end


end
