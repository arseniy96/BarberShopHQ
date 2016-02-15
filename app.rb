#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

  Client.create params[:client]

	erb "Спасибо. Вы записались!"
end

get '/feedback' do
  erb :feedback
end

post '/feedback' do
	@email = params[:email]
  @mes = params[:mes]

	Contact.create :email => @email, :message => @mes

  redirect '/feedback'
end