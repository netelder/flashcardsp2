enable :sessions

get '/' do
  if session[:user_id] == user.id
    erb :profile
  else
    erb :index
  end
end

post '/login' do 
  user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  unless user.nil?
    session[:user_id] = user.id
    erb :profile
  else
    erb :index
  end
end


get '/users/start' do
  params[:deck_type]
  erb :round
end

post '/users/new' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password])
  erb :index
end

get '/logout' do
  session.clear
  erb :index
end
