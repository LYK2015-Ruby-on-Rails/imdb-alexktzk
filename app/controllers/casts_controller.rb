class CastsController < ApplicationController
  before_action :cast_params, only: [:show, :create]

  def index
    @casts = Cast.all
  end

  def new
    @cast = Cast.new
    @countries = Country.all
    @occupations = Occupation.all
    @movies = Movie.all
  end

  def create
    @cast = Cast.create(cast_params)
    sign_contracts(params[:cast][:occupation_ids])
  end

  def sign_contracts(occupation_ids)
    occupation_ids.reject(&:empty?).each do |occupation_id|
      Contract.create(cast_id: @cast.id, occupation_id: occupation_id.to_i, movie_id: 1)
    end
  end

  private
  def set_cast
    @cast = Cast.find params[:id]
  end

  def cast_params
    params.require(:cast).permit(:born, :nationality, :occupation_ids,
                                 full_name: [:first_name, :second_name, :last_name])
  end
end
