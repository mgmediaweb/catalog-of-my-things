require_relative './game'

def write_games
  games = []
  @games.each do |game|
    @player = {
      'first_name' => game.author.first_name,
      'last_name' => game.author.last_name,
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at,
      'publish_date' => game.publish_date,
      'archived' => game.archived
    }
    games << @player
  end
  
  FileUtils.mkdir_p('storage')
  File.write('./storage/games.json', JSON.pretty_generate(games), mode: 'w')
end

def read_games
  return unless File.exist?('./storage/games.json')

  games = File.read('./storage/games.json')
  games = JSON.parse(games)
  games.each do |play|
    new_game = Game.new(play['multiplayer'], play['last_played_at'], play['publish_date'], play['archived'])
    new_game.author = Author.new(play['first_name'], play['last_name'])
    @games << new_game
  end
end
