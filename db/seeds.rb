# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(username:"Misha",email:"misha@email.com",password:'123456')
User.create!(username:"Dima",email:"dima@email.com",password:'123456')
User.create!(username:"Sasha",email:"sasha@email.com",password:'123456')
User.create!(username:"Dasha",email:"dasha@email.com",password:'123456')

usernames = ['24adsf','stfu','gaddd','lolek','zealot','trol','gajin','samurai','schutze','strelok']
usernames.each do |n|
  User.create(username:n,email:"#{n}@email.com",password:'123456')
end