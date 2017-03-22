require ('pg')
require_relative ('db/sql_runner')
require_relative('models/artist')
require_relative('models/album')

Album.delete_all

Artist.delete_all

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'Ryan Adams'})
artist3 = Artist.new({'name' => 'Rolling Stones'})


artist1.save()
artist2.save()
artist3.save()


album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Purple Rain',
  'genre' => 'Rock'
  })

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Around the World in a Day',
  'genre' => 'Rock'
  })

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Gold',
  'genre' => 'Alt-Country'
  })

album4 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Blue and Lonesome',
  'genre' => 'Blues'
  })

album1.save()
album2.save()
album3.save()
album4.save()


binding.pry
nil