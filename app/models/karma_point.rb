class KarmaPoint < ActiveRecord::Base
  after_save :change_karma_points
  
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  def change_karma_points
    self.user.total_points = self.user.karma_points.sum(:value)
    self.user.save
  end


end
