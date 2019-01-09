class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Updated successfully!"
      redirect_to profile_path
    else
      flash[:alert] = "Doh!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :bio, :website_url, :password, :password_confirmation, :remember_me)
  end
end
