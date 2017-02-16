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
  erb :"pokemon/new"
end

post '/pokemon' do
  pokemon = Pokemon.create(name: params[:name], poke_type: params[:poke_type], cp: params[:cp], img_url: "#")
  redirect "/pokemon/#{pokemon.id}"
 end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

get '/' do
  redirect "/pokemon"
end
