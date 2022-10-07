require_relative './classes/app'

def main_menu
  puts "\nOOPS Library# Please choose an option by entering a number:
1 -> List all books
2 -> List all members
3 -> Create a member
4 -> Create a book
5 -> Create a rental
6 -> List all rentals for person id
7 -> quit app"
  print "OOPS Library# "
  gets.to_i
end

def main(app = App.new)
  input = main_menu
  if input.positive? && input <= 6
    app.process(input)
    main(app)
  elsif input == 7
    puts 'OOPS Library# Quitted program'
  else
    puts 'OOPS Library# Please enter a valid input'
    main(app)
  end
end

main
