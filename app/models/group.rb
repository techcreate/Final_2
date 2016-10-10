class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user 

  def find_join_id current_user
  	Join.select(:id).where(user: current_user, group: self)[0].id 
  end
end
