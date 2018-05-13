class BorrowingsController < ApplicationController
  before_action :set_borrowing, only: [:show, :edit, :update, :destroy]

  # GET /borrowings
  # GET /borrowings.json
  def index
    borrowings_scope = Borrowing.all
    borrowings_scope = borrowings_scope.is_lost if params[:is_lost] == "1"
    borrowings_scope = borrowings_scope.is_damaged if params[:is_damaged] == "1"
    @borrowings = smart_listing_create(:borrowings,
                                    borrowings_scope,
                                    partial: "borrowings/list"
                                   )
  end

  # GET /borrowings/1
  # GET /borrowings/1.json
  def show
  end

  # GET /borrowings/new
  def new
    @borrowing = Borrowing.new
  end

  # GET /borrowings/1/edit
  def edit
  end

  # POST /borrowings
  # POST /borrowings.json
  def create
    @borrowing = Borrowing.new(set_params(borrowing_params))
    @borrowing.save
  end

  # PATCH/PUT /borrowings/1
  # PATCH/PUT /borrowings/1.json
  def update
    @borrowing.update(set_params(borrowing_params))
  end

  # DELETE /borrowings/1
  # DELETE /borrowings/1.json
  def destroy
    @borrowing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowing
      @borrowing = Borrowing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrowing_params
      params.fetch(:borrowing, {}).permit(:book, :friend, :borrow_date,
        :is_lost, :is_damaged, :return_date,:comment)
    end

    def set_params(params)
      params[:book] = Book.find(params[:book])
      params[:friend] = Friend.find(params[:friend])
      return params
    end
end
