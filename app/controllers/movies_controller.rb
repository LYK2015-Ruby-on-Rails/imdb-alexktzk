class MoviesController < ApplicationController
  before_action :all_occupations, only: [:new, :edit]
  before_action :all_movies, only: [:new, :index, :edit]
  before_action :all_genres, only: [:new, :edit, :index]
  before_action :movie_params, only: [:create]
  before_action :set_movie, only: [:show, :edit, :update]

  def index;
  end

  def edit;
  end

  def show;
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    @movie.save_genres(params[:movie][:genre_ids])
    @movie.sign_contracts(params[:movie][:occupation_ids])
    redirect_to movies_path
  end

  def update
    @movie.update(movie_params)
    @movie.update_genres(params[:movie][:genre_ids])
    @movie.sign_contracts(params[:movie][:occupation_ids])
    redirect_to movies_path
  end

  def search
  end


  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration,
                                  :poster, :genre_ids, :description)
  end
end
