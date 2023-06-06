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
    @eateries = Eatery.all
    @eateries.to_json
  end

  # Display detailed information about an eatery
  get '/eateries/:id' do
    @eatery = Eatery.find(params[:id])
    @reviews = @eatery.reviews
    { eatery: @eatery, reviews: @reviews }.to_json
  end

  # Add a new eatery
  post '/eateries' do
    data = JSON.parse(request.body.read)
    eatery = Eatery.create(name: data['name'], location: data['location'], rating: data['rating'])
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
    eatery.update(name: data['name'], location: data['location'], rating: data['rating'])
    eatery.to_json
  end

  # Delete an eatery
  delete '/eateries/:id' do
    eatery = Eatery.find(params[:id])
    eatery.destroy
    { message: 'Eatery deleted successfully' }.to_json
  end
end
