class Noop
  def initialize(printer)
    @printer = printer
  end

  def execute(*_args)
    @printer.puts("rubygems: unknown command. Seek help")

    1
  end
end