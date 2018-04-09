class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :users

  # def users_attributes=(user_attributes)
  #   user_attributes.values.each do |user_attribute|
  #     user = User.find_of_create_by(user_attribute)
  #     self.users << user
  #   end
  # end

  # def comments_attributes=(comment_attributes)
  #   comment_attributes.values.each do |comment_attribute|
  #     comment = Comment.find_of_create_by(comment_attribute)
  #     self.comments << comment
  #   end
  # end

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |index, category_attributes|
      if category_attributes[:name].present?
        category = Category.find_or_create_by(name: category_attributes[:name])
        if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        end
      end
    end
  end

end
