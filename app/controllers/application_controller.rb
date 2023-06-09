require 'sinatra/base'
require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  # Display a list of eateries
  get '/eateries' do
    eateries = Eatery.all.includes(:reviews) # Eager load the reviews association
    eateries_json = eateries.as_json(include: :reviews) # Convert to JSON including reviews
    eateries_json.to_json
  end

  get '/reviews' do
    @reviews = Review.all
    @reviews.to_json
  end

  # Display detailed information about an eatery
  get '/eateries/:id' do
    @eatery = Eatery.find(params[:id])
    @reviews = @eatery.reviews
    { eatery: @eatery, reviews: @reviews }.to_json(include: :reviews)
  end

  # Add a new eatery
  post '/eateries' do
    data = JSON.parse(request.body.read)
    eatery = Eatery.create(name: data['name'], location: data['location'], rating: data['rating'], picture: data['picture'])
    eatery.to_json
  end

  # Add a review to an eatery
  post '/eateries/:id/reviews' do
    data = JSON.parse(request.body.read)
    eatery = Eatery.find(params[:id])
    review = eatery.reviews.create(picture: data['picture'], comment: data['comment'])
    review.to_json
  end

  # Edit an eatery
  patch '/eateries/:id' do
    eatery = Eatery.find(params[:id])
    data = JSON.parse(request.body.read)
    eatery.update(name: data['name'], location: data['location'], rating: data['rating'], picture: data['picture'])
    eatery.to_json
  end

  # Add a review to an eatery with a picture and comment
  post '/eateries/:id/reviews' do
    data = JSON.parse(request.body.read)
    eatery = Eatery.find(params[:id])
    review = eatery.reviews.create(picture: data['picture'], comment: data['comment'])
    review.to_json(include: :eatery)
  end

  # Delete an eatery
  delete '/eateries/:id' do
    eatery = Eatery.find(params[:id])
    if eatery.destroy
      { message: 'Eatery deleted successfully' }.to_json
    else
      status 500
      { message: 'Failed to delete eatery' }.to_json
    end
  end

  # Delete a review
  delete '/reviews/:id' do
    review = Review.find(params[:id])
    if review.destroy
      { message: 'Review deleted successfully' }.to_json
    else
      status 500
      { message: 'Failed to delete review' }.to_json
    end
  end

  # Delete an eatery
  delete '/eateries/:id' do
    eatery = Eatery.find(params[:id])
    if eatery.destroy
      { message: 'Eatery deleted successfully' }.to_json
    else
      status 500
      { message: 'Failed to delete eatery' }.to_json
    end
  end

end

