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

  end

  def self.delete_all()
  
  end

  def self.all()

  end

  def albums()

  end

  def self.find()

  end

  def edit()

  end



end