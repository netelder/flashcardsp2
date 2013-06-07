deck2 = Deck.create(name: "Ruby")

lines_array = File.readlines('ruby_cards.txt',"\n\n").map { |a| a.split("\n") }
lines_array.collect { |pair| deck2.cards << Card.create(question: pair[0], answer: pair[1])}
