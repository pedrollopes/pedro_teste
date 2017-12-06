class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]
  
  
    def index
      @passengers = Passenger.order(:name).paginate(:page => params[:page], :per_page => 10)
    end
  
    def new
      @passenger = Passenger.new
    end
  
    def create
      @passenger = Passenger.new(passenger_params)
  
      respond_to do |format|
        if @passenger.save
          format.html { redirect_to passengers_path, notice: I18n.t('messages.create_success') } #message: contato criado com sucesso
          format.json { render :show, status: :created, location: @passenger }
        else
          format.html { render :new }
          format.json { render json: @passenger.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @passenger.destroy
      respond_to do |format|
        format.html { redirect_to passengers_path, notice: I18n.t('messages.destroy_success') } #message: contato removido com sucesso
        format.json { head :no_content }
      end
    end
  
    def edit
    end
  
    def update
      @passenger = Passenger.new(passenger_params)
      
          respond_to do |format|
            if @passenger.save
              format.html { redirect_to passengers_path, notice: I18n.t('messages.create_success') } #message: contato atualizado
              format.json { render :show, status: :created, location: @passenger }
            else
              format.html { render :new }
              format.json { render json: @passenger.errors, status: :unprocessable_entity }
            end
          end
    end
  
  
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def passenger_params
      params.require(:passenger).permit(:name, :birth, :cpf, :car_model, :status, :sex)
    end
end
