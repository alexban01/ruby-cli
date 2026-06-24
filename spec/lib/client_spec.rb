require './lib/client'

RSpec.describe 'Client' do
  it 'API key is in the Authorization header' do
    ENV['RUBY_KEY'] = '1234567890'

    client = Client.new

    expect(client.rubygems.headers['Authorization']).to eq('1234567890')
  end
end
