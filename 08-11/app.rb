# `gem install sinatra` and then
require 'sinatra'
require 'pry'

# This defines a route
get '/' do
  'Hello world!'
end

# This handles /goodbye
get '/goodbye' do
  'Goodbye world!'
end

# looks like
# something.each do |object|
#   ...
# end
# get is a method that sinatra defines
get('/method') { 'This is just Ruby' }

get '/hasthelargehadroncolliderdestroyedtheworldyet' do
  okay = "Nope."
  #erb :nope, :locals => { :status => okay }
  haml :nope2, :locals => { :status => okay }
end

get '/times' do
  # params is a function from Sinatra
  #   it returns a hash of values set using
  #   ?key=value&key2=value2 from the web
  @max = params[:max].to_i # defaults to 0
  @min = params[:min].to_i
  haml :table
end

get '/user/:id/profile' do
  # Key in the params is defined by the
  #   name (after :) in route
  "The passed id is: #{params[:id]}"
end
