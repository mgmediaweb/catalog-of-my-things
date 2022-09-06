require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id, :name, :publish_date

  def initialize(name, on_spotify)
    super(publish_date)
    @id = Random.rand(1...1000)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super || @on_spotify == true

    false
  end
end
