class Eatery < ActiveRecord::Base
  has_many :reviews
  # has_many :users, through: :reviews
end
#   def reviews
#     Review.where(hotel_id: self.hotel_ids)
#   end

#   def users
#     User.where(id: self.user_ids)
#   end

#   def print_all_reviews
#     self.reviews.each do |review|
#       user = self.users.find(review.user_id)
#       puts "Review for #{review.hotel_name} by #{user.user_name}: #{review.rating}. #{review.comments}"
#     end
#   end

#   def average_rating
#     self.reviews.average(:rating)
#   end
# end
