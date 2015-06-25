class Person

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
end