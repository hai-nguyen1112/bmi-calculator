class RecordsController < ApplicationController

  before_action :get_record, only: [:show, :destroy]
  before_action :require_login

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record[:bmi] = @record.bmi_cal
    @record[:status] = @record.bmi_status
    @record[:risk] = @record.bmi_risk
    @record[:ideal_weight] = @record.ideal_weight
    @record[:bmr] = @record.bmr
    if @record.weight.to_f > @record.ideal_weight.to_f
      @record[:weight_to_lose] = @record.ideal_weight_difference
    else
      @record[:weight_to_gain] = @record.ideal_weight_difference
    end

    byebug
    # @record[:weight_to_gain] = '1'
    # @record[:weight_to_lose] = '10'
    # @record[:bmr] = '135'
    # @record[:goal] = '5'
    # @record[:cals_to_burn_per_day] = '500'
    # @record[:cals_to_consume_per_day] = '2500'
    if @record.save
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    user_id = @record.user.id
    @record.destroy
    redirect_to user_path(User.find(user_id))
  end

  private

  def get_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:user_id, :weight, :height_ft, :height_in, :sex, :age, :bmi, :status, :risk, :ideal_weight, :weight_to_lose, :weight_to_gain, :bmr, :goal, :cals_to_burn_per_day, :cals_to_consume_per_day)
  end

end
