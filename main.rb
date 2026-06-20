#!/usr/bin/ruby

require './lib/command_factory'


exit_code = CommandFactory.create($stdout, ARGV).execute(*ARGV[1..])

exit exit_code