class Review < ActiveRecord::Base
  # belongs_to :user
  belongs_to :eatery

  # def user
  #   User.find(self.user_id)
  # end

  # def hotel
  #   Hotel.find(self.hotel_id)
  # end

  # def print_review
  #   user = self.user
  #   hotel = self.hotel
  #   puts "Review for #{hotel.hotel_name} by #{user.user_name}: #{self.rating}. #{self.comments}"
  # end

  # def leave_review(user, rating, comment)
  #   Review.create(user_id: user.id, hotel_id: self.id, rating: rating, comments: comment)
  # end

end
