# Film4Evening
Helps to choose which film to watch by director's name.
Library of films loads from kinopoisk.ru

##Usage 

`main.rb`

###Load options

####From dir
Script also supports loading from `data` folder, where files contains info in this order:

- title
- year
- director

change `library = FilmLib.from_dir('./data/*')` in 19 line `main.rb`
