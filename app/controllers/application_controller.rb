require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  
  get '/registrations/signup' do
    erb :'/registration/signup' 
  end

  get '/' do
    erb :index
  end

  post '/registration' do 
    @user = User.new(username: params[:username], password: params[:password], balance: params[:balance])
    #binding.pry
    @user.save
    session[:user_id] = @user.id
    redirect '/account'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    #binding.pry
    if @user 
      session[:user_id] = @user.id
      redirect '/account'
    #if Helpers.is_logged_in?(session) || user = Helpers.current_user(session)
    end   
      erb :error 
     end
    

    get '/account' do
      
    @user = User.find_by(id: session[:user_id])
    #binding.pry
     if @user
      erb :account
     else
      erb :error
    end
  end

  get '/logout' do
  session.clear
  redirect '/'
  end

  get '/error' do 
    erb :error
  end


end

