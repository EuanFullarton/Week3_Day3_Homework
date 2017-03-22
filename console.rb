require ('pg')
require_relative ('../db/sql_runner')
require_relative('models/artist')
require_relative('models/album')

Artist.delete_all

Album.delete_all

artist1 = Artist.new({'name' => 'Prince'})

artist1.save()

album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'Rock'
  })

album1.save()

binding.pry
nil