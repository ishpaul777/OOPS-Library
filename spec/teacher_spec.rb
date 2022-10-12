require_relative '..\classes\teacher'
describe Teacher do
  context 'When testing the Teacher class' do
    teacher = Teacher.new('Maths', 41, 'john', 1)
    it 'Initialized with name, age, id, parent_permission?' do
      name = teacher.name
      age = teacher.age
      specialization = teacher.specialization
      id = teacher.id
      expect(name).to eq 'john'
      expect(id).to eq 1
      expect(age).to eq 41
      expect(specialization).to eq 'Maths'
    end
    it 'can this student use services return true' do
      can_use_services = teacher.can_use_services?
      expect(can_use_services).to be true
    end
  end
end
