require './lib/client'
require 'pry'
require './lib/program_result'

class Show
  def initialize(printer)
    @printer = printer
    @client = Client.new
  end

  def execute(gem_name)
    gem = @client.fetch("/api/v1/gems/#{gem_name}.json")
    print_info(gem)
    0
  end

  private

    def print_info(gem)
      @printer.puts "--------Name: #{gem['name']} --------"
      @printer.puts "Version: #{gem['version']}"
      @printer.puts "Authors: #{gem['authors']}"
      @printer.puts "Info: #{gem['info']}"
      @printer.puts "Homepage: #{gem['homepage_uri']}"
      @printer.puts "---------------------------------------"
      @printer.puts
    end
end
