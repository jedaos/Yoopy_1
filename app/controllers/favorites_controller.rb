class FavoritesController < ApplicationController
  before_action :validate_user, only: [:create, :destroy]
  def show
    if current_hospital
      @favorites = current_hospital.favorites
    elsif current_friend
      @favorites = current_friend.favorites
    end
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.create(favorite_params)
    if @favorite.save
      flash[:success] = "#{Prof.find(@favorite.profs_id).name} has been added to your favorites!"
      redirect_to profs_path
    elsif @favorite.errors.any?
      redirect_to profs_path
      flash[:error] = "#{Prof.find(@favorite.profs_id).name} has already been added to your favorites"
  end
end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    if @favorite.errors.any?
      @error = @favorite.errors.full_messages
      p @error
    elsif @favorite.destroy
      @fave_delete = "#{@favorite.name} has been removed from your favorites!"
    end
  end
  private
  def favorite_params
    params.require(:favorite).permit(:favoritable_type, :favoritable_id, :profs_id)
  end

  def validate_user
    redirect_to home_index_path unless current_friend || current_hospital
  end
end
