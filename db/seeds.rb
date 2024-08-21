require "open-uri"
puts "Let's find out who the baddest loser is!"

puts "Clearing the DB..."

Point.destroy_all
Board.destroy_all
Friendship.destroy_all
User.destroy_all

if Point.count == 0 && Board.count == 0 && Friendship.count == 0 && User.count == 0
  puts "DB is clear!"
end

user = User.create!(email: "meg@cat.com", password: "123456", username: "Mr Kitty")
user.save!
user = User.create!(email: "ki@kitty.com", password: "secret", username: "Madame Cat")
user.save!

puts "#{User.count} users created! #{User.first.username} and #{User.last.username}"

Friendship.create!(user: User.first, friend_user: User.last)

puts "#{Friendship.count} friendship created! #{Friendship.first.user.username} and #{Friendship.first.friend_user.username}"

Board.create!(name: "Badgammon", friendship: Friendship.first, game: "Backgammon")

puts "#{Board.count} board created! #{Board.first.name} by #{Board.first.friendship.user.username} with #{Board.first.friendship.friend_user.username}"

Point.create!(board: Board.first, user: User.first, value: 3)
Point.create!(board: Board.first, user: User.last, value: 1)

puts "#{Point.count} points created so #{Point.first.user.username} wins #{Point.first.board.name}"

puts "And thats it! DB is seeded!"
