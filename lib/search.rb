require 'net/http'
require 'json'
require 'uri'
require 'faraday'

class Search
  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end

  def search(gem_name)
    gems = fetch_data("https://rubygems.org/api/v1/search.json?query=#{gem_name}")
    for gem in gems do
      puts "--------Name: #{gem['name']} --------"
      puts "Version: #{gem['version']}"
      puts "Authors: #{gem['authors']}"
      puts "Info: #{gem['info']}"
      puts "Homepage: #{gem['homepage_uri']}"
      puts "Downloads: #{gem['downloads']}"
      puts "---------------------------------------"
      puts
    end
  end
end
