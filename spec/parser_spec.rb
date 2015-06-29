require_relative '../parser'

describe Parser do

  let(:comma_delimited_file) {'ruby-code-test-files/comma_delimited.txt'}
  let(:pipe_delimited_file) {'ruby-code-test-files/pipe_delimited.txt'}
  let(:space_delimited_file) {'ruby-code-test-files/space_delimited.txt'}

  it 'Parser.parse should take a file open it and output and array' do
    expect(Parser.parse(comma_delimited_file)).to be_an(Array)
    expect(Parser.parse(comma_delimited_file).length).to be > 3
  end

  it 'Parser.parse should return an Array with the first value being the delimter' do
    expect(Parser.parse(comma_delimited_file).first).to eq(',')
    expect(Parser.parse(pipe_delimited_file).first).to eq('|')
    expect(Parser.parse(space_delimited_file).first).to eq(' ')
  end

  it 'Parser.create_people_objects should return an Array of Person objects' do
    expect(Parser.create_people_objects(comma_delimited_file)).to all be_an_instance_of(Person)
    expect(Parser.create_people_objects(pipe_delimited_file)).to all be_an_instance_of(Person)
    expect(Parser.create_people_objects(space_delimited_file)).to all be_an_instance_of(Person)
  end

  it 'Parser.parse_and_combine should return an Array of Person objects from all inputed files' do
    files = [comma_delimited_file, pipe_delimited_file, space_delimited_file]
    expect(Parser.parse_and_combine(files)).to be_an(Array)
    expect(Parser.parse_and_combine(files)).to all be_a(Person)
  end

end