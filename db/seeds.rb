require 'faker'
10.times do
  user = User.new(name: Faker::Name.name, email:  Faker::Internet.email,
  password: 123456)
  user.save
  rand(5..10).times do
    emmend = Emmend.new(
      user_id: user.id,
      project: Faker::Coffee.intensifier,
      thema: Faker::Coffee.variety,
      name: Faker::Coffee.intensifier,
      description: Faker::Coffee.notes
      )
    emmend.save
    Support.create(
      user_id: User.all.sample.id,
      emmend_id: Emmend.all.sample.id
      )
    end
end
puts "Creating a test_user: email: tanise@email.com, password: 123456"
user = User.new(name:"Tanise", email:  "tanise@email.com",
  password: 123456)
user.save

