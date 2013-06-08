require 'csv'
system("pwd")
topic = Topic.create(name: "Ruby")

lines_array = File.readlines('ruby_cards.txt',"\n\n").map { |a| a.split("\n") }
lines_array.collect { |pair| topic.cards << Card.create(question: pair[0], answer: pair[1])}

periodic = Topic.create(name: "Periodic Table")
CSV.foreach('periodictable.csv', headers:true) do |data|
  periodic.cards << Card.create(question: data[0], answer: data[1])
end

capitals = Topic.create(name: "World Capitals")
CSV.foreach('worldcapitals.csv', headers:true) do |data|
  capitals.cards << Card.create(question: data[0], answer: data[1])
end