require_relative 'person'
require_relative 'parser'

# Use ARGV in the future to parse file

files =
  [ 'ruby-code-test-files/pipe_delimited.txt',
    'ruby-code-test-files/comma_delimited.txt',
    'ruby-code-test-files/space_delimited.txt'
  ]

p Parser.parse_and_combine files
