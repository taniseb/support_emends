
require 'json'
require 'open-uri'
User.destroy_all

url="https://dadosabertos.camara.leg.br/api/v2/proposicoes?ano=2020&ordem=ASC&ordenarPor=id"
#https://www.camara.leg.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=PL&numero=&ano=2020&datApresentacaoIni=&datApresentacaoFim=&parteNomeAutor=&idTipoAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao=1"

response = open(url).read

data = JSON.parse(response)
emmend_total= data["dados"]
ids=[]

emmend_total.each do |e|
  ids << e["id"]
end

def find_thema(id)
    id_url="https://dadosabertos.camara.leg.br/api/v2/proposicoes/#{id}/temas"
    response = open(id_url).read
    subject = JSON.parse(response)
    emmend_thema= subject["dados"]
    themas=[]
    emmend_thema.each do |i|
      themas << i["tema"]
    end
    themas[0]
    themas[0].blank? ? "Direitos Humanos": themas[0]
end
def find_author(id)
    id_url ="https://dadosabertos.camara.leg.br/api/v2/proposicoes/#{id}/autores"
    response = open(id_url).read
    subject = JSON.parse(response)
    auth = subject["dados"]
    authors=[]
    auth.each do |i|
      authors << i["nome"]
    end
    authors[0]
end
emmend_total.each do |e|
    user = User.create!(
      email: Faker::Internet.email,
      password: 123456,
      name: find_author(e["id"])
      )
    emmend = Emmend.new(
      user_id: user.id,
      project: "#{e["numero"]}/#{e["ano"]}",
      thema:find_thema(e["id"]),
      name: "#{e["ementa"]}",
      description: "#{e["ementaDetalhada"]}"
      )
    emmend.save!
end

10.times do
    Support.create!(
     user_id: User.all.sample.id,
     emmend_id: Emmend.all.sample.id
     )
end


