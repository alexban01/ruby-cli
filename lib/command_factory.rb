
require './lib/noop'
require './lib/show'
require './lib/search'

class CommandFactory
  class << self
    def create(printer, args)
      case args[0]
      when "show"
        Show.new(printer)
      when "search"
        Search.new(printer)
      else
        Noop.new(printer)
      end
    end
  end
end