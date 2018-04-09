class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments, :reject_if => :reject_comments
  accepts_nested_attributes_for :users

  def reject_comments(attributes)
    attributes[:content].blank?
  end
end
