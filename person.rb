class Person

  attr_reader :first_name, :last_name, :gender, :favorite_color, :birthdate
  def initialize args = {}
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = convert_gender args[:gender]
    @favorite_color = args[:favorite_color]
    @birthdate = convert_birthdate args[:birthdate]
  end

  def convert_birthdate birthdate
    birthdate.gsub('-', '/')
  end

  def convert_gender gender
    gender.downcase[0] == 'f' ? 'Female' : 'Male'
  end

  def self.sort_by_gender people
    people = people.group_by(&:gender)
    sorted_people = sort_by_last_name(people['Female'], 'DESC')
    sorted_people << (sort_by_last_name people['Male'], 'DESC')
    sorted_people.flatten
  end

  def self.sort_by_birthdate people
    people.sort_by {|person| Time.new(person.birthdate) }
  end

  def self.sort_by_last_name people, direction = 'ASC'
    sorted_people = people.sort_by {|person| person.last_name.downcase }
    if direction.downcase[0] == 'd'
      return sorted_people
    else
      return sorted_people.reverse
    end
  end

  def to_s
    "#{last_name} #{first_name} #{gender} #{birthdate} #{favorite_color}"
  end
end