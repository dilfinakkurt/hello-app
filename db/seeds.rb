puts "Seeding users..."

users = [
	{ name: "Ada Lovelace", email: "ada@example.com" },
	{ name: "Alan Turing", email: "alan@example.com" },
	{ name: "Grace Hopper", email: "grace@example.com" }
]

users.each do |attrs|
	User.find_or_create_by!(email: attrs[:email]) do |u|
		u.name = attrs[:name]
	end
end

puts "Seed complete. Users count: #{User.count}"
