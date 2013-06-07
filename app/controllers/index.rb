get '/' do
<<<<<<< HEAD
  erb :index
end

post '/login' do 
    User.find_by_name("david").try(:authenticate, "mUc3m00RsqyRe")

  #vailidate
  #create session_key
  erb :profile
end

get '/users/start' do
  params[:deck_type]
  erb :round
end

post '/users/new' do
  user = User.create(name: params[:name], email: params[:email], :password: params[:password], :password_confirmation: params[:password])
  #conditional on session key
  erb :profile
end

get '/logout' do

end

=======
  # Look in app/views/index.erb
  erb :index
end
>>>>>>> 4c4697aea5cd44ee378ffefffdd726eb2808bb86
