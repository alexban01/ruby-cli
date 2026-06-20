require 'json'
require 'faraday'
require 'pry'
require './lib/program_result'

class Show
  def initialize(client)
    @client = client
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

  def show2(args)
    gem_name = args[1]

    gem_data = @client.gem(gem_name)

    exit_code = 0
    ProgramResult.new(gem_data.name, gem_data.info, exit_code)
  end

  # def show(gem_name)
  #   gem = fetch_data("https://rubygems.org/api/v1/gems/#{gem_name}.json")
  #   print_info(gem)
  #   0
  # end
end
