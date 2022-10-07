require_relative './classes/app'

def main_menu
  puts "\n Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - quit app"
  gets.to_i
end

def main(app = App.new)
  input = main_menu
  if input.positive? && input <= 6
    app.process(input)
    main(app)
  elsif input == 7
    return
  else
    puts 'Please enter a valid input'
    main(app)
  end
end

main
