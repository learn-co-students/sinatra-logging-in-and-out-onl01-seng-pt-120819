require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    end
    erb :error
  end
  # In the controller action that processes the POST request, you'll want to find the user in the database based on their username.
  # If there is a match, set the session to the user's ID, redirect them to the /account route (using redirect to), and use ERB to display the user's data on the page.
  # If there is no match, render the error page.

  get '/account' do
    erb :account
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end

end

