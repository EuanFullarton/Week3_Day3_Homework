require ('pg')
require_relative ('../db/sql_runner')
require_relative ('album')

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
      sql =
      "INSERT INTO artists (name)
      VALUES ('#{@name}') RETURNING *"
      artist = SqlRunner.run(sql).first()
      @id = artist['id'].to_i
  end

  def edit()
    sql = "UPDATE artists SET
     (name) = 
     ('#{@name}')
     WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map{|artist| Artist.new(artist)}
    return artists
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    results = SqlRunner.run(sql)
    albums = results.map{|album| Album.new(album)}
    return albums
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    result = SqlRunner.run(sql)
    found_artist = result.first()
    return found_artist
  end


end