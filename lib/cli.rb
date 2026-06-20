require 'net/http'
require 'json'
require 'uri'
require 'faraday'

class Program
  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end

  def display_simple(data)
    puts "--------Name: #{data['name']} --------"
    puts "Version: #{data['version']}"
    puts "Authors: #{data['authors']}"
    puts "Info: #{data['info']}"
    puts "Homepage: #{data['homepage_uri']}"
    puts "Downloads: #{data['downloads']}"
  end

  def search(gem_name)
    gems = fetch_data("https://rubygems.org/api/v1/search.json?query=#{gem_name}")
    for gem in gems do
      display_simple(gem)
      puts "---------------------------------------"
      puts
    end
  end
end
