require_relative '../person'

describe Person do
  let(:cindy) {Person.new(
                          first_name: 'Cindy',
                          last_name: 'Green',
                          gender: 'F',
                          favorite_color: 'Blue',
                          birthdate: '12-15-1944',
                          )}

  it 'should return a Person object' do
    expect(cindy.class).to eq(Person)
  end

  it 'should convert inputed gender letter into the full gender' do
    expect(cindy.gender).to eq('Female')
  end

  it 'should convert the birthdate format into using backslashes instead of dashes' do
    expect(cindy.birthdate).to eq('12/15/1944')
  end

  it 'should have a to_s method that outputs a standard formatting for a Persons attributes' do
    expect(cindy.to_s).to eq('Green Cindy Female 12/15/1944 Blue')
  end

  describe 'Person Class Methods' do
    let(:people) {[
                  Person.new(first_name: 'James', last_name: 'Bond', gender: 'm', favorite_color: 'Black', birthdate: '10/07/1967'),
                  Person.new(first_name: 'Sue', last_name: 'Freidman', gender: 'f', favorite_color: 'Yellow', birthdate: '4-12-1988'),
                  Person.new(first_name: 'Lisa', last_name: 'Bluesmith', gender: 'f', favorite_color: 'Gold', birthdate: '1/1/1951')
                 ]}
    let(:james) {people[0]}
    let(:sue) {people[1]}
    let(:lisa) {people[2]}

    it 'should sort by gender (female first) and then last name' do
      sorted_by_gender = Person.sort_by_gender people
      expect(sorted_by_gender.first).to eq(lisa)
      expect(sorted_by_gender[1]).to eq(sue)
      expect(sorted_by_gender.last).to eq(james)
    end

    it 'should sort by birthdate then last name in ASCENDING order' do
      sorted_by_birthdate = Person.sort_by_birthdate people
      expect(sorted_by_birthdate.first).to eq(lisa)
      expect(sorted_by_birthdate[1]).to eq(james)
      expect(sorted_by_birthdate.last).to eq(sue)
    end

    it 'should sort by last name in DESCENDING order' do
      sorted_by_last_name = Person.sort_by_last_name people
      expect(sorted_by_last_name.first).to eq(sue)
      expect(sorted_by_last_name[1]).to eq(james)
      expect(sorted_by_last_name.last).to eq(lisa)
    end

  end

end