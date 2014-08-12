require 'haml'
require 'pry'
require 'sinatra'

require './lib/counter'
require './lib/github'
require './lib/hangman'

enable :sessions


get '/' do
  # With alternate layout
  #   haml :root, layout: :other_layout
  # Equivalently (remember option hashes)
  #   haml(:root, { :layout => :other_layout })
  # Either render inside `other_layout.haml`
  haml :root
end


# -- Reverse -----
get '/reverse' do
  haml :reverse
end
post '/reverse' do
  @original = params[:text]
  @result   = @original.reverse
  haml :reverse
end


# -- Count -----
get '/count' do
  haml :count
end
post '/count' do
  @text       = params[:text]
  @separator  = params[:separator]
  @counts     = Counter.new(@text).counts @separator
  haml :count
end


# -- Git API -----
get '/repos' do
  user = params[:user] || "jamesdabbs"
  @repos = Github.repos_for(user)
  haml :repos
end


# -- Hangman -----

before do
  session[:hangman] ||= {}
end

# INDEX
get '/hangman' do
  @games = session[:hangman]
  haml :'hangman/index'
end

# CREATE
post '/hangman' do
  next_id = (session[:hangman].keys.max || 0) + 1
  session[:hangman][next_id] = Hangman.new
  redirect to("/hangman/#{next_id}")
end

# SHOW
get '/hangman/:game_id' do
  @id   = params[:game_id].to_i
  @game = session[:hangman][@id]
  haml :'hangman/show'
end

# UPDATE
post '/hangman/:game_id' do
  @id     = params[:game_id].to_i
  @game   = session[:hangman][@id]
  @guess  = params[:guess]
  @hit    = @game.guess(@guess)

  # or redirect to("/hangman/#{@id}") ?
  haml :'hangman/show'
end


# -- Blastoff -----
get '/blastoff' do
  haml :blastoff
end
post '/blastoff' do
  script_path = File.expand_path "../bin/drone.rb", __FILE__
  puts script_path
  `bundle exec ruby #{script_path}`
  redirect to('/blastoff')
end
