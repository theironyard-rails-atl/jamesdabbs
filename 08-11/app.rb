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
