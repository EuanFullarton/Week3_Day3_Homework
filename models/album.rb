require ('pg')
require ('pry')
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
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = 
    "INSERT INTO albums 
    (title, genre, artist_id) 
    VALUES 
    ('#{@title}', '#{@genre}', #{@artist_id}) 
    RETURNING *"


    @id = db.exec(sql).first()['id'].to_i
    db.close()
  end

  def update()
    sql = "UPDATE albums SET
     (title, genre) = 
     ('#{@title}', '#{@genre}')
     WHERE id = #{@id}"
     SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
        result = SqlRunner.run(sql)
        albums = result.map{|album| Album.new(album)}
        return albums
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    found_artist = result[0] 
    artist = Artist.new(found_artist)
    return artist
  end

  def self.find()

  end

  def edit()

  end


end



