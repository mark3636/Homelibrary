class FriendsController < ApplicationController
  before_action :set_friend, only: [:edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    friends_scope = Friend.all
    friends_scope = friends_scope.like(params[:filter]) if params[:filter]
    @friends = smart_listing_create(:friends,
                                    friends_scope,
                                    partial: "friends/list"
                                   )
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)
    @friend.save
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    @friend.update(friend_params)
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.fetch(:friend, {}).permit(:full_name, :email, :phone_number, :social_profile, :comment)
    end
end
