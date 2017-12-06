class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]


  def index
    @drivers = Driver.order(:name).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to drivers_path, notice: I18n.t('messages.create_success') } #message: contato criado com sucesso
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_path, notice: I18n.t('messages.destroy_success') } #message: contato removido com sucesso
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
    @driver = Driver.new(driver_params)
    
        respond_to do |format|
          if @driver.save
            format.html { redirect_to drivers_path, notice: I18n.t('messages.create_success') } #message: contato atualizado
            format.json { render :show, status: :created, location: @driver }
          else
            format.html { render :new }
            format.json { render json: @driver.errors, status: :unprocessable_entity }
          end
        end
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_driver
    @driver = Driver.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def driver_params
    params.require(:driver).permit(:name, :birth, :cpf, :car_model, :status, :sex)
  end
  
end