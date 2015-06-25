module Parser

  extend self
  def parse file
    opened_file = File.open file
    lines = []
    delimiter = nil
    opened_file.each do |line|
      delimiter = self.find_delimiter line
      lines << line.split(delimiter).map(&:strip)
    end
    lines.unshift delimiter
  end

  def find_delimiter line
    if line.include? ','
      return ','
    elsif line.include? '|'
      return '|'
    else
      return ' '
    end
  end

end