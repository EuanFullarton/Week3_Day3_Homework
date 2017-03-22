require ('pg')
require_relative ('../db/sql_runner')
require_relative ('artist')

class Album
  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id'].to_i
  end

  def save()

  end

  def self.delete_all()
  
  end

  def self.all()

  end

  def artist()

  end

  def self.find()

  end

  def edit()

  end


end



