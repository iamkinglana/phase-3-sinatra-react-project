class Review < ActiveRecord::Base
  belongs_to :eatery

  # def eatery
  #   Eatery.find(self.eatery_id)
  # end

  # def print_review
  #   eatery = self.eatery
  #   puts "Review for #{eatery.name}: #{self.rating}. #{self.comments}"
  # end

  # def leave_review(eatery, rating, comment)
  #   Review.create(eatery_id: eatery.id, rating: rating, comments: comment)
  # end
end
