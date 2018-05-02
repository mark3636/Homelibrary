class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    books_scope = Book.all
    books_scope = books_scope.like(params[:filter]) if params[:filter]
    @books = smart_listing_create(:books, Book.all,
                                  partial: "books/list"
                                )
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(set_params(book_params))
    @book.save
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book.update(set_params(book_params))
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.fetch(:book, {}).permit(:name, :pub_year, :pic_author, :translator,
         :author, :comment, :publishing_house, :genres => [])
    end

    def set_params(params)
      params[:publishing_house] = PublishingHouse.find(params[:publishing_house].to_i)
      genres = []
      params[:genres].to_a[1..-1].each { |genre|
        genres << Genre.find(genre.to_i)
      }
      params[:genres] = genres
      return params
    end
end
