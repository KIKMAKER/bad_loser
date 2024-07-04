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
file = URI.open("https://res-console.cloudinary.com/dq1yih0di/thumbnails/v1/image/upload/v1720126053/bWlzdGVyX2tpdHR5X2FuZHJ3OA==/drilldown")
user.photo.attach(io: file, filename: "mr_kitty.png", content_type: "image/png")
user.save!
user = User.create!(email: "ki@kitty.com", password: "secret", username: "Madame Cat")
file = URI.open("https://res-console.cloudinary.com/dq1yih0di/thumbnails/v1/image/upload/v1720126381/bWFkYW1lX2NhdF9xYjVkYWc=/drilldown")
user.photo.attach(io: file, filename: "madame_cat.png", content_type: "image/png")
user.save!

puts "#{User.count} users created! #{User.first.username} and #{User.last.username}"

Friendship.create!(user: User.first, friend_user: User.last)

puts "#{Friendship.count} friendships created! #{Friendship.first.user.username} and #{Friendship.first.friend_user.username}"

Board.create!(name: "Badgammon", user: User.first, friend_user_id: User.last.id, game: "Backgammon")

puts "#{Board.count} boards created! #{Board.first.name} by #{Board.first.user.username} with #{Board.first.friend_user.username}"

Point.create!(board: Board.first, user: User.first, value: 3)
Point.create!(board: Board.first, user: User.last, value: 1)

puts "#{Point.count} points created so #{Point.first.user.username} wins #{Point.first.board.name}"

puts "And thats it! DB is seeded!"
