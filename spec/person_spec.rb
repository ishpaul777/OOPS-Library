require_relative '../classes/person'

describe Person do
  context 'When testing the Person class' do
    person = Person.new(19, 1, 'john', parent_permission: false)

    it 'Initialized with name, age, id, parent_permission?' do
      name = person.name
      age = person.age
      parent_permission = person.parent_permission
      id = person.id
      expect(name).to eq 'john'
      expect(id).to eq 1
      expect(age).to eq 19
      expect(parent_permission).to be false
    end

    it 'can this person use services return true' do
      can_use_services = person.can_use_services?
      expect(can_use_services).to be true
    end
  end
end
