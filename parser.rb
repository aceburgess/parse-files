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

  def create_people_objects file
    people = self.parse file
    case people.first
    when ',' then return self.create_people_comma people
    when '|' then return self.create_people_pipe people
    else return self.create_people_space people
    end
  end

  def create_people_comma people
    people.shift
    people.map do |person|
      person = Person.new(
        last_name: person[0],
        first_name: person[1],
        gender: person[2],
        favorite_color: person[3],
        birthdate: person[4]
      )
    end
  end

  def create_people_pipe people
    people.shift
    people.map do |person|
      person = Person.new(
        last_name: person[0],
        first_name: person[1],
        gender: person[3],
        favorite_color: person[4],
        birthdate: person[5]
      )
    end
  end

  def create_people_space people
    people.shift
    people.map do |person|
      person = Person.new(
        last_name: person[0],
        first_name: person[1],
        gender: person[3],
        birthdate: person[4],
        favorite_color: person[5]
      )
    end
  end

end