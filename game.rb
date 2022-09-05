# require_relative './item'
require 'date'

class Game < Item
  super()
  attr_accessor :multiplayer, :last_played_at, :publish_date, :archived

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_at = Time.new.year - Date.parse(@last_played_at)
    super() && last_played_at > 2 ? true : false
  end
end