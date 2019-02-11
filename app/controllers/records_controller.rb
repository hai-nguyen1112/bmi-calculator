class RecordsController < ApplicationController

  before_action :get_record, only: :show
  before_action :require_login

  def new
    @record = Record.new
  end

  def create
    # response = Unirest.post "https://bmi.p.rapidapi.com/",
    #   headers:{
    #   "X-RapidAPI-Key" => "dca5c638d7msh57465eba26e4804p1ea7d7jsn11d365218428",
    #   "Content-Type" => "application/json"
    #   }
    #   "{\"weight\":{\"value\":\"85.00\",\"unit\":\"lb\"},\"height\":{\"value\":\"170\",\"unit\":\"cm\"},\"sex\":\"m\",\"age\":\"31\"}"
    @record = Record.new(record_params)
    @record[:bmi] = '12'
    @record[:status] = 'Healthy'
    @record[:risk] = 'Heart Disease'
    @record[:ideal_weight] = '60'
    @record[:weight_to_gain] = '1'
    @record[:weight_to_gain] = '10'
    @record[:bmr] = '135'
    @record[:goal] = '5'
    @record[:cals_to_burn_per_day] = '500'
    @record[:cals_to_consume_per_day] = '2500'
    if @record.save
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def show
  end

  private

  def get_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:user_id, :weight, :height_ft, :height_in, :sex, :age) #:bmi, :status, :risk, :ideal_weight, :weight_to_lose, :weight_to_gain, :bmr, :goal, :cals_to_burn_per_day, :cals_to_consume_per_day)
  end

end
