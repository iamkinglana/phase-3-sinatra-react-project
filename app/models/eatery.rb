class Eatery < ActiveRecord::Base
  has_many :reviews

  # def print_all_reviews
  #   self.reviews.each do |review|
  #     puts "Review for #{self.name}: #{review.rating}. #{review.comments}"
  #   end
  # end

  # def average_rating
  #   self.reviews.average(:rating)
  # end
end
