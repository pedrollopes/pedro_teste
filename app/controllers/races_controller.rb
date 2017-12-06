class RacesController < ApplicationController
  before_action :set_race, only: [:show, :edit, :update, :destroy]  
  before_action :set_options_for_select, only: [:index, :edit, :new, :update, :create]

  def index
    @races = Race.order(:id).paginate(:page => params[:page], :per_page => 10)
  end
  
  def new
    @race = Race.new
  end 

  def create
    @race = Race.new(race_params)

    respond_to do |format|
      if @race.save
        format.html { redirect_to races_path, notice: I18n.t('messages.create_success') } #message: contato criado com sucesso
        format.json { render :show, status: :created, location: @race }
      else
        format.html { render :new }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end



  private

  def set_race
    @race = Race.find(params[:id])
  end

  def race_params
    params.require(:race).permit(:driver_id, :passenger_id, :value)
  end

  def set_options_for_select
    @driver_options_for_select = Driver.all
    @passenger_options_for_select = Passenger.all
  end



end
