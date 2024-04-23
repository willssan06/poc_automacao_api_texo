require 'httparty'
require 'rspec'

# Cenário 1 - Realizar uma requisição do tipo GET
describe 'Realizar uma requisição do tipo GET' do
  it 'pesquisando pelo atributo name: alias odio sit' do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/comments', query: { name: 'alias odio sit' })

    expect(response.code).to eq(200)

    json_data = JSON.parse(response.body)
    expect(json_data.size).to be > 0

    # Validar o email do objeto retornado
    expect(json_data.first['email']).not_to be_empty
  end
end

# Cenário 2 - Realizar uma requisição do tipo POST
describe 'Realizar uma requisição do tipo POST' do
  it 'enviando os valores no body' do
    body = {
      name: 'John Doe',
      username: 'johndoe',
      email: 'johndoe@example.com',
      address: {
        street: 'Rua ABC',
        suite: 'Apto 123',
        city: 'São Paulo',
        zipcode: '12345-678',
        geo: {
          lat: '-23.456',
          lng: '-46.789'
        }
      },
      phone: '123456789',
      website: 'http://www.example.com',
      company: {
        name: 'Example Company',
        catchPhrase: 'Your catch phrase',
        bs: 'Your BS'
      }
    }

    response = HTTParty.post('https://jsonplaceholder.typicode.com/users', body: body)

    expect(response.code).to eq(201)

    json_data = JSON.parse(response.body)
    expect(json_data['id']).not_to be_nil
  end
end

# Cenário 3 - Realizar uma requisição do tipo PUT
describe 'Realizar uma requisição do tipo PUT' do
  it 'alterando os valores dos campos: email, lat e lng do usuário com id = 5' do
    body = {
      email: 'newemail@example.com',
      address: {
        geo: {
          lat: '10.123',
          lng: '20.456'
        }
      }
    }

    response = HTTParty.put('https://jsonplaceholder.typicode.com/users/5', body: body)

    expect(response.code).to eq(200)

    json_data = JSON.parse(response.body)
    expect(json_data['email']).to eq('newemail@example.com')
    expect(json_data['address']['geo']['lat']).to eq('10.123')
    expect(json_data['address']['geo']['lng']).to eq('20.456')
  end
end