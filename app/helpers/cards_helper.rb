helpers do
  def play()

  end
end

# get '/users/start/:deck_id' do |deck_id|
#   @round = Round.create(user_id: current_user.id, deck_id: deck_id)
#   @cards = Deck.find(deck_id).cards.shuffle
#   @card = @cards.pop
#   erb :round
# end

# post '/users/play' do 
#   user_answer = params[:answer]
#   @card = @cards.pop
#   erb :round
# end



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


