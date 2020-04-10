# encoding: utf-8

require_relative 'lib/film'
require_relative 'lib/film_lib'

def get_input(num)
  input = 0
  until input.between?(1, num)
    puts "Введите одну из предложенных цифр"
    input = STDIN.gets.to_i
  end
  input
end

puts "Из какого количества фильмов сделать выборку? (От 1 до 200)"

num = get_input(200)

library = FilmLib.films_from_site(num)

abort "Превышено количество запросов. Попробуйте позже." if library.films.empty?

puts
puts "Выберите цифрой режиссера чей фильм вы хотели бы посмотреть."
puts

library.directors.each_with_index do |director, index|
  puts "#{index + 1} #{director}"
end

puts
input = get_input(library.directors.size)

film = library.get_random_film(input)

puts
puts film
