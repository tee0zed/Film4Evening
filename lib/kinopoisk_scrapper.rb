# encoding: utf-8

require 'nokogiri'
require 'open-uri'

module KinopoiskScrapper
  def films_from_site(number)
    return if number > 200
    page = Nokogiri::HTML.parse(open('https://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/200/'))

    data = page.css('tr.js-film-list-item>td.news').first(number - 1)

    FilmLib.new(prepare_films(data))
  end

  def prepare_films(data)
    data.map do |div|
      args = {}
      args[:title] = div.css('a.all').text
      args[:year] = div.css('span').text[/\d+/]
      args[:director] = div.css('a.lined').first.text

      Film.new(args)
    end
  end
end
