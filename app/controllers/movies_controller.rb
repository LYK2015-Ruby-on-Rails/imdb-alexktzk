class MoviesController < ApplicationController
  before_action :movie_params, only: [:create]
  before_action :all_occupations, only: [:new]
  before_action :all_movies, only: [:new, :index]
  before_action :set_movie, only: [:new]

  def new
  end

  def create
    @movie = Movie.create(movie_params)
    @movie.sign_contracts(params[:movie][:occupation_ids])
  end

  private
  def set_movie
    @movie = Movie.new
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration)
  end

  def all_occupations
    @occupations = Occupation.all
  end

  def all_movies
    @movies = Movie.all
  end
end
