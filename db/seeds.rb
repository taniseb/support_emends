require 'faker'
2.times do
  user = User.new(name: Faker::Name.name, email:  Faker::Internet.email,
  password: 123456)
  user.save
  rand(1..2).times do
    emmend = Emmend.new(
      user_id: user.id,
      project: "Monopólio das Teles",
      thema: "5G",
      name: "Fora Monopólio",
      description: "A qualidade do serviço precisa melhorar"
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

