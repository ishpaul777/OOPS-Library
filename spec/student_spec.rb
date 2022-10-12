require_relative '..\classes\student'
require_relative '..\classes\Association\classroom'
describe Student do
  context 'When testing the Person class' do
    classroom = Classroom.new('9-A')
    student = Student.new(classroom, 19, 'john', 1, parent_permission: false)
    it 'Initialized with name, age, id, parent_permission?' do
      name = student.name
      age = student.age
      parent_permission = student.parent_permission
      id = student.id
      classroom = student.classroom.label
      expect(name).to eq 'john'
      expect(id).to eq 1
      expect(age).to eq 19
      expect(classroom).to eq '9-A'
      expect(parent_permission).to be false
    end
    it 'can this student use services return true' do
      can_use_services = student.can_use_services?
      expect(can_use_services).to be true
    end
    it 'student can play hooky' do
      play_hooky = student.play_hooky
      expect(play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
