class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    sort_by = params[:sort_by]
    sort_order = params[:sort_order] == 'desc' ? 'desc' : 'asc'

    if sort_by.in?(['title', 'release_date'])
      @movies = Movie.order("LOWER(#{sort_by}) #{sort_order}")
    else
      @movies = Movie.all
    end

    @sort_by = sort_by
    @sort_order = sort_order
  end

  def show
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "Filme criado com sucesso"
    else
      render "movies/create_movie", status: :unprocessable_entity
    end
  end

  def add
    render "movies/create_movie"
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path, notice: "Filme atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy!
    redirect_to movies_path, notice: "Filme deletado com sucesso!"
  end

  # NOVO - action de busca no TMDb
  def search_tmdb
    query = params[:query]
    results = Movie.find_in_tmdb(query)

    if results.blank?
      flash[:alert] = "'#{query}' was not found in TMDb."
      redirect_to root_path
    end
  end

  private

  def set_movie
    @movie = Movie.find(params.expect(:id))
  end

  def movie_params
    params.expect(movie: [ :title, :rating, :release_date ])
  end
end