class Cinema

  attr_accessor :name, :location
  
  def initialize(name, location)
    @name = name
    @location = location
    @movies = []
  end

  # receives an object
  def add_movie (movie)
    @movies << movie
    movie.cinema = self
  end

end


class Movie

  attr_accessor :title, :showtime, :cinema

  @@all = []

  def initialize (title, showtime)
    @title = title  
    @showtime = showtime
    @@all << self
  end
end