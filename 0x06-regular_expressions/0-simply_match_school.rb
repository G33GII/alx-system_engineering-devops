#!/usr/bin/env ruby
# Ruby script that accepts one argument and pass it to a regular expression matching method
#    - The regular expression must match "School"


if ARGV.empty?
  puts "Please provide an argument."
else
    arr = []
    for str in ARGV do
        if str.match(/Scho.l/)
            arr << str
        end
    end
    print arr.join()
    puts
end

