enable :sessions

get '/' do
  if session[:user_id]
    erb :profile
  else
    erb :index
  end
end

post '/login' do 
  user = User.find_by_email(params[:email])
  if user.check_password(params[:password_digest])
    session[:user_id] = user.id
    erb :profile
  else
    erb :index
  end
end

get '/game/:topic_id' do |topic_id|
    session[:cards] = Card.where("topic_id = ?", 1).pluck("id").shuffle.join(' ')
    session[:gamestat_id] = Gamestat.create(user_id: current_user.id).id
    @cards = session[:cards].split(" ")
    @card = Card.find(@cards.pop)
    session[:cards] = @cards.join(" ")

  erb :game
end

# cookies ... localstorage ... form fields ... URL ... <-- CLIENTSIDE | SERVERSIDE --> ... session ... IMDB ... disk DB

post '/game' do
  content_type 'json'

  card = Card.find(params[:card_id])
  if  card.correct?(params[:answer])
    Gamestat.find(session[:gamestat_id]).increment!("correct_count")
    response = 'correct'
  else
    Gamestat.find(session[:gamestat_id]).increment!("incorrect_count")
    response = 'incorrect'
  end
  Gamestat.find(session[:gamestat_id]).increment!("guess_count")
  @cards = session[:cards].split(" ")
  @card = Card.find(@cards.pop)
  session[:cards] = @cards.join(" ")

  ["Your answer was #{response}.", @card.question, @card.id].to_json
  #erb :game
end
                                                                                                                                                                                                                                                                                                                                  
# until @cards.empty? 
#   @card = @cards.pop
#   show card.question
#   get answer

# end


post '/users/new' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password_digest], password_confirmation: params[:pass_conf])
  erb :index
end

get '/logout' do
  session.clear
  erb :index
end
