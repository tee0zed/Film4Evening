# encoding: utf-8

class Film
  attr_reader :title, :director, :year

  def initialize(args)
    @title = args[:title]
    @year = args[:year]
    @director = args[:director]
  end

  def to_s
    "Фильм: #{title}, Режиссер: #{director}, Год: #{year}"
  end
end
