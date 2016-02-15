#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
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
  @c = Client.new
	erb :visit
end

post '/visit' do

  @c = Client.new params[:client]
  if @c.save
		erb "Спасибо. Вы записались!"
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end
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