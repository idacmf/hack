class Activity < ActiveRecord::Base
  has_many :activity_adv
  belongs_to :city
end
