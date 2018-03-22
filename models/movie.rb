require('pg')
require_relative('../db/sql_runner')
require_relative('./star')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre  = options['genre']
    @rating = options['rating']
  end

  def save
    sql = ("INSERT INTO movies
    (title, genre, rating)
    VALUES
    ($1, $2, $3)
    RETURNING id")
    values = [@title, @genre, @rating]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete
    sql = ('DELETE FROM movies WHERE id = $1')
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = ("UPDATE movies SET
    title = $1,
    genre = $2,
    rating = $3
    WHERE id = $4")
    values = [@title, @genre, @rating, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
   sql = "SELECT * FROM movies"
   movie_hashes = SqlRunner.run(sql)
   movie_objects = movie_hashes.map{|person| Movie.new(person)}
   return movie_objects
 end

 def show_stars
    sql = "SELECT stars.*
      FROM stars
      INNER JOIN castings
      ON castings.star_id = stars.id
      WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run( sql, values )
    result = stars.map{ |star| Star.new(star) }
    return result
  end

# p Movie.all

end
