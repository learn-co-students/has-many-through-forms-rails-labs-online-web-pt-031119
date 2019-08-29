class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attributes|
      user = User.find_or_create_by(user_attributes)
      self.user << user
    end
  end
end
