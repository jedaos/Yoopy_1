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

  def edit
    @prof = Prof.find(params[:id])
  end

  def update
    @prof = Prof.find(params[:id])
    avatar = params[:prof][:avatar]
    @prof.avatar.attach(avatar)
    if @prof.save
      flash[:success] = "A profile image will now be displayed for users to see"
      redirect_to dashboard_index_path
    else
      flash[:error] = "Profile image was not stored successfully"
    end
  end

  def destroy
    @prof = Prof.find(params[:id])
    Favorite.all.where(prof_id: @prof.id).destroy_all
    @prof.destroy
    redirect_to home_index_path
  end 
  private
  def prof_params
    params.require(:prof).permit(:name, :job_title, :bio, :phone, :email, :avatar, :address, :password)
  end
end
