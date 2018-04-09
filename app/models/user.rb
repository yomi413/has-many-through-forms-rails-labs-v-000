class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  # def unique_username
  #   # self.select(:username).distinct
  #   self.all.uniq
  # end
end
