require 'date'
require_relative './label'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :label, :genre, :author

  def initialize(id, publish_date, archived: false)
    @id = id || Random.rand(1..999)
    my_date = publish_date.split('-')
    @publish_date = Date.new(my_date[0].to_i, my_date[1].to_i, my_date[2].to_i)
    @archived = archived
    move_to_archive
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).to_i > 10

    false
  end
end
