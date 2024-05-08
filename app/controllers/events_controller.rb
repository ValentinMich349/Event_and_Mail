class EventsController < ApplicationController
  
  before_action :authenticate_user, only: [:create, :destroy, :show]


  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.admin = User.find_by(admin: true)

    if @event.save
      flash[:success] = "Événement créé avec succès."
      redirect_to @event
    else
      flash[:error] = "Erreur lors de la création de l'événement."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event bien mis à jour !"
    else
      render :edit
    end
  end

  

  def destroy
    puts "Methode trouvé"
    @event = Event.find(params[:id])
    @event.destroy if @event
    redirect_to events_path
    flash[:success] = "Ton Evenement a été supprimé "
    
  end
  

  private


  def authenticate_user
    unless current_user
      redirect_to new_user_session_path
      flash[:danger] = "Connecte toi !"
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :duration)
  end
  
end

