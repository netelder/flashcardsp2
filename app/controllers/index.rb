enable :sessions

get '/' do
  if session[:user_id]
    erb :profile
  else
    erb :index
  end
end

post '/login' do 
  @decks = Deck.all
  user = User.find_by_email(params[:email])
  if user.check_password(params[:password_digest])
    session[:user_id] = user.id
    erb :profile
  else
    erb :index
  end
end

get '/users/start/:deck_id' do |deck_id|
  @round = Round.create(user_id: current_user.id, deck_id: deck_id)
  @cards = Deck.find(deck_id).cards.shuffle
  @card = @cards.pop
  erb :round
end

post '/users/play' do 
  user_answer = params[:answer]
  @card = @cards.pop
  erb :round
end

# until @cards.empty? 
#   @card = @cards.pop
#   show card.question
#   get answer
#   if answer == card.answer
#     round.correct_count += 1
#   else
#     show card.answer
#     round.incorrect_count += 1
#     @cards.unshift(card)
#   end
#   round.guess_count += 1
# end


post '/users/new' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password_digest], password_confirmation: params[:pass_conf])
  erb :index
end

get '/logout' do
  session.clear
  erb :index
end
