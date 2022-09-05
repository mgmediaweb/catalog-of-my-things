# require_relative './item'
require 'date'

class Game < Item 
  super()
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_at = Date.today - @last_played_at
    super() && last_played_at > 2 ? true : false
  end
end