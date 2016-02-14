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

get '/' do
  @barbers = Barber.order "created_at DESC"
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

	ebr "Спасибо, #{@user_name}. Вы записаны на #{@date_time} к парикмахеру #{@barber}"
end