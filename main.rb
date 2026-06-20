#!/usr/bin/ruby

require './lib/show'

exit_code = Show.new($stdout).execute(*ARGV)

exit exit_code