module MoviesHelper
  def print_date(movie)
    movie.release_date.strftime('%e %b')
  end

  def print_duration(movie)
    d = movie.duration.divmod(60)
    hours = d[0] < 10 ? "0#{d[0]}" : d[0].to_s
    minutes = d[1] < 10 ? "0#{d[1]}" : d[1].to_s
    hours + ":" + minutes
  end
end
