require_relative './game'

def add_game
  print 'Is this game for multiplayer? [Y/N]: '
  multiplayer = get.comp.downcase
  multiple_player = multiplayer == 'y'
  print 'Please enter the date this game was last played in [YYYY]: '
  last_played_at = gets.comp
  print 'What was the date this game was published? [YYYY]: '
  publish_date = gets.comp
  print 'Has this game been archived? [Y/N]: '
  archieved = gets.comp.downcase
  puts 'Enter author first name: '
  author_first_name = gets.comp.capitalize
  puts 'Enter author last name: '
  author_last_name = gets.comp.capitalize
  author = Author.new(author_first_name, author_last_name)
  game = Game.new(multiple_player, last_played_at, publish_date, publish_date, archieved)
  game.author = author
  @games.push(game)
  puts 'The game has beeen added successfully!'
end

def list_all_games
  puts 'There are no games here!' if games.empty?
  @games.each_with_index do |game, index|
    print "[#{index + 1}] - Multiplayer: #{game.multiplayer}"
    puts "Last Played: #{game.last_played_at}, Archieved: #{game.archived}"
  end
end

def list_all_authors
  puts 'There are no authors here!' if @games.empty?
  @games.each_with_index do |game, index|
    puts "#{index + 1} - #{game.author.first_name}, #{game.author.last_name}"
  end
end
