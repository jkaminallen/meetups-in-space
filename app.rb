require 'sinatra'
require_relative 'config/application'

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/new' do
  erb :'meetups/new'
end

post '/meetups/new' do
  name = params['name']
  location = params['location']
  description = params['description']
  id = params['id']

  @meetup = Meetup.create(name: name, location: location, description: description, creator: "Jon")

    if @meetup.save
      flash[:notice] = "You have created an event."
      redirect "/meetups/#{@meetup.id}"

    else
      @error = flash[:notice] = "Please fill out form completely"
      erb:'/meetups/new'
    end
end

get '/meetups/:id' do
  @meetup = Meetup.all.find(params[:id])
  @usermeetups = Usermeetup.all
  @attendees = []
  @usermeetups.each do |usermeetup|
    if usermeetup.meetup_id == params[:id].to_i
      @attendees << usermeetup.user
      # @name = usermeetup.user.username
      # @avatars << usermeetup.user.avatar_url
    end
  end
  erb :'meetups/show'
end
