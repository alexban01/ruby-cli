#!/usr/bin/ruby

require './lib/show'

result = Show.new.show(ARGV[1])

exit result