#!/usr/bin/env ruby
# Bash script that outputs: [SENDER],[RECEIVER],[FLAGS]
#       sender phone number or name (including country code if present)
#       receiver phone number or name (including country code if present)
#        flags that were used.

puts ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(",")
