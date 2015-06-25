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

  def to_s
    "#{last_name} #{first_name} #{gender} #{birthdate} #{favorite_color}"
  end
end