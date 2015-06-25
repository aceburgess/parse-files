class Person

  attr_reader :first_name, :last_name, :gender, :favorite_color, :birthdate
  def initialize args = {}
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = convert_gender args[:gender]
    @favorite_color = args[:favorite_color]
    @birthdate = convert_birthdate args[:birthdate]
  end

  def self.sort_by_gender people
    people = people.group_by(&:gender)
    sorted_people = sort_by_last_name(people['Female'], 'DESC')
    sorted_people << (sort_by_last_name people['Male'], 'DESC')
    sorted_people.flatten
  end

  def self.sort_by_birthdate people
    people = people.group_by do |person|
      birthdate = person.birthdate.split('/').map(&:to_i)
      days = birthdate[2] * 365
      days += birthdate[0] * 31
      days += birthdate[1]
      days
    end
    people = people.sort_by do |date, group_of_people|
      date
    end
    people.flatten.select {|obj| obj.class != Fixnum }
  end

  def self.sort_by_last_name people, direction = 'ASC'
    sorted_people = people.sort_by {|person| person.last_name.downcase }
    direction.downcase[0] == 'd' ? sorted_people : sorted_people.reverse
  end

  def to_s
    "#{last_name} #{first_name} #{gender} #{birthdate} #{favorite_color}"
  end

  def birthdate_to_integer
    birthdate = self.birthdate.split('/').map(&:to_i)
    days = birthdate[2] * 365
    days += birthdate[0] * 31
    days += birthdate[1]
    days
  end

  private
  def convert_birthdate birthdate
    birthdate.gsub('-', '/')
  end

  def convert_gender gender
    gender.downcase[0] == 'f' ? 'Female' : 'Male'
  end
end