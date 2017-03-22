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
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      sql =
      "INSERT INTO artists (name)
      VALUES ('#{@name}') RETURNING *"

      @id = db.exec(sql).first()['id'].to_i
      db.close()
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

  def self.find()

  end

  def edit()

  end



end