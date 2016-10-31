# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{name: 'John Doe'},
		     {name: 'Jane Doe'},
		     {name: 'Dr. White'},
		     {name: 'Dr. Brandle'},
		     {name: 'Dr. Cramer'},
		     {name: 'Dr. Denning'},
		     {name: 'Dr. Stanley'},
		     {name: 'Prof. Bauson'} ])

def random_string(length)
    # from http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
    (1...length).map { ('a'..'z').to_a[rand 26] }.join
end

items = []
1000.times do
    name = random_string(rand(25))
    value = Random::DEFAULT.rand(100.0)
    items << Item.create(description: name, price: value)
end

def make_order(user, items)
    num_mins = rand(1_500_000)
    order = Order.new(user: user, created_at: num_mins.minutes.ago)
    num_items = [rand(10) + 1, items.size].min
    item = items.sample
    num_items.times { order.line_items.build(item: item, quantity: rand(5)) }

    order.save
end

10_000.times { make_order(users.sample, items) }

abc = Item.create([{description: 'ABC', price: 9.99}])
make_order(users.sample, abc)
