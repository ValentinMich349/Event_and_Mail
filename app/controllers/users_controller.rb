class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:create, :show] 
  before_action :correct_user, only: [:show]

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def show
      @user = User.find(params[:id])
      @events = @user.events
    end
    
    def create
        
        #@user = User.new(users_params)
        @user = User.new(first_name: params[:first_name],
         last_name: params[:last_name],
         description: params[:description],
         email: params[:email],
         age: params[:age],
         password: params[:pass_first],
         password_confirmation: params[:pass_second])
        
        if @user.save
          puts "Je save l'utilisateur"
          log_in(@user)
          puts "Il est save"
          redirect_to users_path 
          flash[:success] = "Ton profil a été crée !"
        else
          puts "Redirige, pas save"
          render new_user_path
          flash[:danger] = "Remplissez tous les champs"
        end
    end

    def update
      @user = User.find(params[:id])
       
    
      if @user.update(user_params)
        redirect_to @user, notice: 'Profil mis à jour avec succès.'
      else
        render :edit
      end
    end
    
      private 
    
      def users_params  
        params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :password_confirmation)
      end

      def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_user_session_path
        end
      end

      def correct_user
        redirect_to(root_path) unless current_user.id == params[:id].to_i
      end
end


