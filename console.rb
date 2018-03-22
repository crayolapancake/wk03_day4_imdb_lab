require_relative('./models/star')
require_relative('./models/movie')
require_relative('./models/casting')
require('pry-byebug')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()


star1 = Star.new({'first_name' =>'Brad',
  'last_name' => 'Pitt'})
star1.save

star2 = Star.new({'first_name' => 'Clint',
    'last_name' => 'Eastwood'})
star2.save

star3 = Star.new({'first_name' => 'Scarlett',
  'last_name' => 'Johansson'
  })
star3.save

star4 = Star.new({'first_name' => 'Edward',
  'last_name' => 'Norton'
  })
star4.save

movie1 = Movie.new ({'title' => 'Fight Club',
  'genre' => 'thriller',
  'rating' => 10})
movie1.save

movie2 = Movie.new ({ 'title' => 'Inglorious Basterds',
  'genre' => 'action',
  'rating' => 7})
movie2.save

movie3 = Movie.new ({ 'title' => 'Grand Turino',
  'genre' => 'drama',
  'rating' => 6})
movie3.save

movie4 = Movie.new ({ 'title' => 'Million Dollar Baby',
  'genre' => 'drama',
  'rating' => 4})
movie4.save

casting1 = Casting.new({ 'movie_id' => movie1.id,
  'star_id' => star1.id,
  'fee' => 1000000
  })
casting1.save

casting2 = Casting.new({ 'movie_id' => movie1.id,
  'star_id' => star4.id,
  'fee' => 800000
  })
casting2.save



star2.delete
movie4.delete

star3.first_name = "JarJar"
star3.last_name = "Binks"
star3.update

# movie2.title = "Interview with a Vampire"
# movie2.genre = "fantasy"
movie2.rating = "6"
movie2.update

p Star.all
p Movie.all
p star1.show_movies
p movie1.show_stars

# binding.pry
