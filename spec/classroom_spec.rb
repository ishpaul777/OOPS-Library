require_relative '../classes/student'
require_relative '../classes/Association/classroom'
describe Classroom do
  context 'When testing the classroom class' do
    classroom = Classroom.new('9-A')
    it 'Initialized with label' do
      label = classroom.label
      expect(label).to eq '9-A'
    end
    it 'has added jane and john student in the classroom' do
      Student.new(classroom, 19, 'john', 1, parent_permission: false)
      Student.new(classroom, 19, 'jane', 2)
      students = classroom.students
      expect(students[0].name).to eq 'john'
      expect(students[1].name).to eq 'jane'
    end
  end
end
