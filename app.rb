require "sinatra"
require "sinatra/reloader"
require "pry"
require "active_record"
require "pg"

require_relative "db/connection"
require_relative "models/pokemon"

get '/pokemon' do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end

get '/pokemon/new' do
erb : "pokemon/new"
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
erb :"pokemon/show"
end

post '/pokemon' do
  @pokemon = Pokemon.create(params[:pokemon])
redirect "/pokemon/#{pokemon.id}"
get '/' do
  redirect "/pokemon"
end
