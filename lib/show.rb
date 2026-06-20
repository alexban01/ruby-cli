require 'json'
require 'faraday'
require 'pry'
require './lib/program_result'

class Show
  def initialize(printer)
    @printer = printer
  end

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
      @printer.puts "--------Name: #{gem['name']} --------"
      @printer.puts "Version: #{gem['version']}"
      @printer.puts "Authors: #{gem['authors']}"
      @printer.puts "Info: #{gem['info']}"
      @printer.puts "Homepage: #{gem['homepage_uri']}"
      @printer.puts "Downloads: #{gem['downloads']}"
      @printer.puts "---------------------------------------"
      @printer.puts
    end
end
