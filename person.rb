class Person

  def initialize args = {}
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = args[:gender]
    @favorite_color = args[:favorite_color]
    @birthdate = args[:birthdate]
  end

  def convert_birthday
  end
end