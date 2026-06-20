require 'json'
require 'faraday'
require 'pry'
require './lib/program_result'

class Show
  def execute(gem_name)
    gem = fetch_data("https://rubygems.org/api/v1/gems/#{gem_name}.json")
    print_info(gem)
    0
  end

  private

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
end
