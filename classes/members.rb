require_relative './student'
require_relative './teacher'
require_relative './Association/classrooms'

class Members
  attr_accessor :list

  def initialize(classrooms)
    @list = []
    get_members(classrooms)
  end

  def get_members(classrooms)
    students = JSON.parse(File.read('Data/students.json'))

    students.each do |student|
      # puts student['name']
      class_of_stdnt = []
      classrooms.list.each do |classroom|
        class_of_stdnt << classroom if student['classroom'] == classroom.label
      end

      if class_of_stdnt.empty?
        classrooms.create_classroom(student['classroom'])
        class_of_stdnt[0] = classrooms.list[classrooms.list.length - 1]
      end

      permission = student['parent_permission']
      newstudent = if permission
                     Student.new(class_of_stdnt[0], student['age'], student['name'], student['id'])
                   else
                     Student.new(class_of_stdnt[0], student['age'], student['name'], student['id'],
                                 parent_permission: false)
                   end
      @list << newstudent
    end

    teachers = JSON.parse(File.read('Data/teachers.json'))
    teachers.each do |teacher|
      new_teacher = Teacher.new(teacher['specialization'], teacher['age'], teacher['name'], teacher['id'])
      @list << new_teacher
    end
  end

  def list_all_members
    puts 'OOPS Library# List of Members ->'
    @list.each do |member|
      print " [#{member.class}] ID: #{member.id}, Name: #{member.name}, Age: #{member.age}, "
      if member.instance_of?(Student)
        print "Class: #{member.classroom.label}\n"
      else
        print "specialization: #{member.specialization}\n"
      end
    end
  end

  def parent_permission?
    print 'OOPS Library# Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'OOPS Library# Please enter a valid input'
      parent_permission?
    end

    parent_permission
  end

  def choose_member_type
    print 'OOPS Library# Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    if [1, 2].include?(type)
      type
    else
      puts 'OOPS Library# Please enter a valid value (1 or 2)'
      choose_member_type
    end
  end

  def choose_classroom(classrooms)
    print 'OOPS Library# Do you want to admit in a new classroom(1) or in exisiting classroom(2)? [Input the number]: '
    response = gets.chomp.to_i
    if [1, 2].include?(response)
      case response
      when 1
        print 'OOPS Library# Label: '
        label = gets.chomp
        classrooms.create_classroom(label)
        classrooms.list[classrooms.list.length - 1]
      when 2
        classrooms.list.each_with_index { |c, i| puts "#{i + 1} -> Label: #{c.label}" }
        print 'OOPS Library# Choose a classroom from the following: [Input the number]'
        index = gets.to_i - 1
        return classrooms.list[index] if index >= 0 && index < classrooms.list.length

        puts 'OOPS Library# Please enter a valid value '
        choose_classroom(classrooms)
      else
        puts 'OOPS Library# Please enter a valid value (1 or 2)'
        choose_classroom(classrooms)
      end
    end
  end

  def create_member(classrooms, data)
    print 'OOPS Library# Age: '
    age = gets.chomp
    print 'OOPS Library# Name: '
    name = gets.chomp
    case choose_member_type
    when 1
      classroom = choose_classroom(classrooms)
      newstudent = if parent_permission?
                     Student.new(classroom, age, name)
                   else
                     Student.new(classroom, age, name, parent_permission: false)
                   end
      @list << newstudent
      data.add_student(newstudent)
      puts 'OOPS Library# Student created successfully'
    when 2
      print 'OOPS Library# Specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(specialization, age, name)
      @list << new_teacher
      data.add_teacher(new_teacher)
      puts 'OOPS Library# Teacher created successfully'
    end
  end
end
