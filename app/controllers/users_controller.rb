class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
  
    def show
      # @user est déjà défini par le before_action
    end
  
    def edit
      # @user est déjà défini par le before_action
    end
  
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank? && params[:user][:current_password].blank?
        # Mise à jour sans mot de passe
        if @user.update(user_params_without_password)
          flash[:success] = 'Profil mis à jour avec succès.'
          redirect_to @user
        else
          flash.now[:alert] = 'Erreur lors de la mise à jour du profil.'
          render :edit
        end
      else
        # Mise à jour avec changement de mot de passe
        if @user.update_with_password(user_params)
          bypass_sign_in(@user)
          flash[:success] = 'Profil mis à jour avec succès.'
          redirect_to @user
        else
          flash.now[:alert] = 'Erreur lors de la mise à jour du profil.'
          render :edit
        end
      end
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :password, :password_confirmation, :current_password)
    end
  
    def user_params_without_password
      params.require(:user).permit(:first_name, :last_name, :address)
    end
  end
  