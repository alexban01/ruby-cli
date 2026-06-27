require './lib/client'
require './lib/gem_data'

class Search
  def initialize(printer)
    @printer = printer
    @client = Client.new
  end

  def execute(gem_name, *options)
    results = @client.fetch("/api/v1/search.json?query=#{gem_name}")

    gems = []
    results.each { |data|
      gems << GemData.new(data['name'], data['info'], data['licenses'], data['downloads'])
    }

    license = license_option(options)
    if license
      filtered = []
      gems.each { |gem|
        if gem.get_license.include?(license)
          filtered << gem
        end
      }
      gems = filtered
    end

    if options.include?('--most-downloads-first')
      gems = gems.sort_by { |gem| -gem.downloads }
    end

    print_gems(gems)
    0
  end

  private

  def license_option(options)
    index = options.index('--license')
    return nil if index.nil?

    options[index + 1]
  end

  def print_gems(gems)
    gems.each do |gem|
      @printer.puts "Name: #{gem.name} - Downloads: #{gem.downloads}"
      @printer.puts "Info: #{gem.info}"
      @printer.puts
    end
  end
end

