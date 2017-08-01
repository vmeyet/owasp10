# This file should contain all the record creation needed to seed the database with its
# default values. The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

now = 1.week.ago
derp = User.create!(username: 'derp', password: '123soleil', admin: false)
derpina = User.create!(username: 'derpina', password: 'jaimelesoeil', admin: false)
nimda = User.create!(username: 'nimda', password: 'S3cur3!', admin: true)
hacker = User.create!(username: 'hacoeur', password: '§rFGCT57687TIUGVCFTRDT5YVrèbè"yuy', admin: true)

derp_derpina_chat = [
  "Hey my love! How are you?",
  "Hey derp ❤️",
  "Wanna go see a movie 2night?",
  "😭, I got my mom tonight so maybe next time, k?",
  "K, I'll go on my own 😖"
]

from = derp
to = derpina

derp_derpina_chat.each_with_index do |message, index|
  ChatMessage.create!(user: from, to_user: to, content: message, created_at: now + 5 * index + rand(5))
  from, to = to, from
end

nimda_derpina_chat = [
  "Hello derpina! Wanna meet me at the hotel 🍆",
  "Of course daddy ❤️ ",
  "Dis is gonna be HOT honey",
  "You make me feel 💦, let me just say to my husband that I don't want to see him",
  "see ya there!"
]
from = nimda
to = derpina

nimda_derpina_chat.each_with_index do |message, index|
  ChatMessage.create!(user: from, to_user: to, content: message, created_at: now + 5 * index + rand(5))
  from, to = to, from
end


Deposit.create!(user: nimda, to_user: derp, amount: 5000_00, comment: 'Salary', created_at: now)
Deposit.create!(user: derp, to_user: derpina, amount: 99_89, comment: 'Nice restaurant', created_at: now + 1.day)
Deposit.create!(user: derp, to_user: derpina, amount: 24_78, comment: 'Flowers', created_at: now + 2.day)
Deposit.create!(user: derpina, to_user: derp, amount: 15_98, comment: 'KFC reimbursment', created_at: now + 2.day + 6.hour)
