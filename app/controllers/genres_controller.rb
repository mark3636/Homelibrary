class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy]

  # GET /genres
  # GET /genres.json
  def index
    genres_scope = Genre.all
    genres_scope = genres_scope.like(params[:filter]) if params[:filter]
    @genres = smart_listing_create(:genres,
                                   genres_scope,
                                   partial: "genres/list"
                                  )
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Genre.new(set_params(genre_params))
    @genre.save
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    @genre.update(set_params(genre_params))
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.fetch(:genre, {}).permit(:name, :parent_genre)
    end

    def set_params(params)
      params[:parent_genre] = params[:parent_genre] == "" ? nil : Genre.find(params[:parent_genre].to_i)
      return params
    end
end
