require 'json'
require 'faraday'
require 'pry'
require './lib/gems'

class Search

  def initialize()
    # @client = client
  end

  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end

  def print_info(gem)
    puts "--------Name: #{gem['name']} --------"
    puts "Version: #{gem['version']}"
    puts "Authors: #{gem['authors']}"
    puts "Info: #{gem['info']}"
    puts "Homepage: #{gem['homepage_uri']}"
    puts "Downloads: #{gem['downloads']}"
    puts "---------------------------------------"
    puts
  end

  def search(gem_name)
    gems = fetch_data("https://rubygems.org/api/v1/search.json?query=#{gem_name}")
    if gems == []
      return Gems.new(gems,1)
    end

    for gem in gems do
      print_info(gem)
    end
    Gems.new(gems,0)
  end
end
