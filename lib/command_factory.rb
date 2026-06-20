
require './lib/noop'
require './lib/show'

class CommandFactory
  class << self
    def create(printer, args)
      case args[0]
      when "show"
        Show.new(printer)
      else
        Noop.new(printer)
      end
    end
  end
end