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
    @event = Event.new(
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user_id: current_user.id
    )


    
    @user = User.find_by(email: params[:email])
    #@gossip = Gossip.create(gossip_params)
    
    if @event.save
      flash[:success] = "Evenement bien créé !"
      redirect_to events_path
    else
      render :new
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
  
  
end

