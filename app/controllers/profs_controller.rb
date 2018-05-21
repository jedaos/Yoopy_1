class ProfsController < ApplicationController
  def index
    @profs = Prof.all
    @favorite = Favorite.new
    if current_friend
      @current_user = current_friend
    elsif current_hospital
      @current_user = current_hospital
    else
      redirect_to home_index_path
    end
  end
end
