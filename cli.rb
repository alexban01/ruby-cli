require 'net/http'
require 'json'
require 'uri'

def fetch_json(url)
  uri = URI(url)
  response = Net::HTTP.get_response(uri)
  data = JSON.parse(response.body)
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
  gems = fetch_json("https://rubygems.org/api/v1/search.json?query=#{gem_name}")
  for gem in gems do
    display_simple(gem)
    puts "---------------------------------------"
    puts
  end
end

command = ARGV[0]
arg1 = ARGV[1]

if command == "search"
  if arg1.nil?
    puts "The search command requires 1 argument: Gem name"
  else
    search(arg1)
  end
else
  puts "No command was given."
end
