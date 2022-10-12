require_relative '..\classes\person'
require_relative '..\classes\decorator\trim'
require_relative '..\classes\decorator\capitalize'

describe Person do
  context 'When testing the Person class' do
    person = Person.new(19, 1, 'maximillimus', parent_permission: false)

    it 'decorates the name' do
      name = person.correct_name
      expect(name).to eq 'maximillimus'
      capitalized_person = CapitalizeDecorator.new(person)
      name = capitalized_person.correct_name
      expect(name).to eq 'Maximillimus'
      capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
      name = capitalized_trimmed_person.correct_name
      expect(name).to eq 'Maximillim'
    end
  end
end
