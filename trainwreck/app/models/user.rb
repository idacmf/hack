class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tournaments
  has_many :teams #, dependent: :destroy #Uncomment/change to enable proper handling.
  has_many :user_notifications

  def self.search(search)
    if search.length < 4
      where("id = ?", "#{search}")
    else if search.match(" ").nil?
      where("email LIKE ? OR first_name LIKE ? OR surname LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%");
    else
      split = search.split(" ", 2)
           where("first_name LIKE ? AND surname LIKE ?", "%#{split[0]}%", "%#{split[1]}%")
         end
    end
  end

end
