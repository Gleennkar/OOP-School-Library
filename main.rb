require_relative '.app'
require_relative '.switch'

def main
  students_teachers = []
  arr_books = []
  rentals = []
  exit = 0
  until exit == 7
    app = App.new
    app.run
    option = gets.chomp.to_i
    exit = option
    switch_options(option, students_teachers, arr_books, rentals)
  end
  puts 'You Exited the App'
end
