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
    if avatar
      @prof.avatar.attach(avatar)
    end
    phone = params[:prof][:phone]    
    if !phone.include? "+1"
      phone.prepend("+1")
    end
    @prof.update(prof_params)
    if @prof.save
      flash[:success] = "Your account information has been updated"
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
