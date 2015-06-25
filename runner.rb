require_relative 'person'
require_relative 'parser'

# Use ARGV in the future to parse file

p Parser.parse 'ruby-code-test-files/comma_delimited.txt'
