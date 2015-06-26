require_relative 'person'
require_relative 'parser'
require_relative 'view'

View.show_menu
files = View.user_input
files = files.split(' ').map(&:strip)
View.name_output_file
output_filename = View.user_input
output_filename = 'output.txt' if output_filename.strip.empty?

Parser.output_people files, output_filename

if File.file?(output_filename)
  View.success output_filename, files
else
  View.failure output_filename, files
end

