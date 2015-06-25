module View

  extend self
  def spacing
    puts '-- ' * 20
  end

  def show_menu
    system 'clear'
    self.spacing
    puts "Parsomatic 1.0 by A. Burgess"
    puts "Enter in the relative paths of the files you would like to parse separated by a space (include the extension)"
  end

  def name_output_file
    self.spacing
    puts "Please enter a filename for the output file (with the extension)"
    puts "If you would like to go with the default 'output.txt' just hit enter"
  end

  def user_input
    gets.chomp
  end

  def success filename, input_files
    self.spacing
    puts "Your file #{filename} has been created from the following files:"
    input_files.each do |filename|
      puts filename
    end
  end

  def failure filename
    self.spacing
    puts "Sorry there was an error when creating #{filename}"
    puts "Please start the program again"
  end

end