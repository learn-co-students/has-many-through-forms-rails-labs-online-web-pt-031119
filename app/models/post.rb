class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :category

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |i, attribute|
      category = Category.find_or_create_by(name: attribute[:name])
      self.post_categories.build(:category => category)
    end
  end
end
