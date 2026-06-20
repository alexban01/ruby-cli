#!/usr/bin/ruby

require './lib/show'

result = Show.new.show(ARGV)

exit result.exit_code