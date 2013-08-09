# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  #is in 1102, timestamp: 22:00
  default_scope :order => 'microposts.created_at DESC'
  
  #is in 1204, timestamp: 18:00
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  private
  
    def self.followed_by(user)
      #after Refactoring
      #followed_ids = user.following.map(&:id).join(", ")
      followed_ids = %(SELECT followed_id FROM relationships WHERE follower_id = :user_id)
      where("user_id IN (#{followed_ids}) OR user_id = :user_id", :user_id => user)
    end
  
  #class methods must be defined with keyword self
  # def self.from_users_followed_by(user)
  #    #is in 1204, timestamp: 12:00, very imp console checkout
  #    followed_ids = user.following.map(&:id).join(", ")
  #    where("user_id IN (#{followed_ids}) OR user_id = ?", user)
  #  end
end




