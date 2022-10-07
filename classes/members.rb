require_relative './student'
require_relative './teacher'
require_relative './Association/classrooms'

class Members
  attr_accessor :list

  def initialize
    @list = []
  end

  def list_all_members
    @list.each { |m| puts "ID: #{m.id}, Name: #{m.name}, Age: #{m.age}" }
  end

  def parent_permission?
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'Please enter a valid input'
      parent_permission?
    end

    parent_permission
  end

  def choose_member_type
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    if [1, 2].include?(type)
      type
    else
      puts 'Please enter a valid value (1 or 2)'
      choose_member_type
    end
  end

  def choose_classroom(classrooms)
    print 'Do you want to admit in a new classroom(1) or in exisiting classroom(2)? [Input the number]: '
    response = gets.chomp.to_i
    if [1, 2].include?(response)
      case response
      when 1
        print 'Label: '
        label = gets.chomp
        classrooms.create_classroom(label)
        classrooms.list[classrooms.list.length - 1]
      when 2
        classrooms.list.each_with_index { |c, i| puts "#{i + 1} -> Label: #{c.label}" }
        print 'Choose a classroom from the following: [Input the number]'
        index = gets.to_i - 1
        return classrooms.list[index] if index >= 0 && index < classrooms.list.length

        puts 'Please enter a valid value '
        choose_classroom(classrooms)
      else
        puts 'Please enter a valid value (1 or 2)'
        choose_classroom(classrooms)
      end
    end
  end

  def create_member(classrooms)
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case choose_member_type
    when 1
      classroom = choose_classroom(classrooms)
      @list << if parent_permission?
                 Student.new(classroom, age, name)
               else
                 Student.new(classroom, age, name, parent_permission: false);
               end
      puts 'Student created successfully'
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @list << Teacher.new(specialization, age, name)
      puts 'Teacher created successfully'
    end
  end
end
