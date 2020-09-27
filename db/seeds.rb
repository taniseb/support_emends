require 'faker'
2.times do
  user = User.new(name: Faker::Name.name, email:  Faker::Internet.email,
  password: 123456)
  user.save
  rand(1..2).times do
    emmend = Emmend.new(
      user_id: user.id,
      project: " #{ Faker::Number.decimal(l_digits: 1, r_digits: 3)}/2020 ",
      thema: 'Reformulação da legislação de concessões e Parcerias Público Privadas',
      # ['Campanha Eleitoral de 2020', 'Reforma Administrativa', 'Privatização das Estatais', 'Queimadas no Pantanal', 'Volta às aulas durante à pandemia', 'Alta nos preços dos alimentos',  'Monopólio das Telecomunicações','5G', 'Meio Ambiente', 'Saúde', 'Segurança Pública', 'Reforma Tributária', 'Prisão em 2º Instância', 'Regulamentação da Regra de Ouro', 'Educação Domiciliar', 'Autonomia do Banco Central', 'Nova Lei de Falências', 'Novo marco legal do mercado de câmbio e capitais', 'Foro Privilegiado', 'PEC Paralela da Previdência', 'Novo marco regulatório do saneamento básico', 'Plano de Equilíbrio Fiscal dos estados', 'MP da Mobilidade Urbana', 'Nova Lei de Licenciamento Ambiental', 'Programa Verde e Amarelo', 'Reformulação da legislação de concessões e Parcerias Público Privadas', 'Distribuição da Vacina do Coronavírus']
      name: "Concessões e PPP no setor de aviação",
      description: "O setor de aviação necessita da realização de concessões e das PPPs"
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

