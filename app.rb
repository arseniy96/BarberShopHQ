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
	@user_name = params[:user_name]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@barber = params[:barber]
	@color = params[:color]

  Client.create :name => @user_name, :phone => @phone, :datestamp => @date_time, :barber => @barber, :color => @color

	erb "Спасибо, #{@user_name}. Вы записаны на #{@date_time} к парикмахеру #{@barber}"
end

get '/feedback' do
  erb :feedback
end

post '/feedback' do
	@email = params[:email]
  @mes = params[:mes]


end