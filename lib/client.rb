require 'json'
require 'faraday'

class Client
  attr_reader :rubygems

  def initialize
    @rubygems = Faraday.new('https://rubygems.org')
    @rubygems.headers['Authorization'] = ENV['RUBY_KEY']
  end

  def fetch(path)
    response = @rubygems.get(path)
    JSON.parse(response.body)
  end
end
