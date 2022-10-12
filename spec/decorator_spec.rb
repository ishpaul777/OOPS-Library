require_relative '..\classes\person'
require_relative '..\classes\decorator\trim.rb'
require_relative '..\classes\decorator\capitalize.rb'

describe Person do
  context "When testing the Person class" do
    person = Person.new(19, 1, "maximillimus", parent_permission: false)

    it "decorates the name" do
      name = person.correct_name
      expect(name).to eq "maximillimus"
      capitalizedPerson = CapitalizeDecorator.new(person)
      name = capitalizedPerson.correct_name
      expect(name).to eq "Maximillimus"
      capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
      name = capitalizedTrimmedPerson.correct_name
      expect(name).to eq "Maximillim"
    end
  end
end
