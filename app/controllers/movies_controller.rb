class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies
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

  # GET /movies/1
  def show
  end

  def edit
    # @movie já é setado pelo before_action
  end
  # POST /movies
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

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      redirect_to movies_path, notice: "Filme atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy!
    redirect_to movies_path, notice: "Filme deletado com sucesso!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.expect(movie: [ :title, :rating, :release_date ])
    end
end
