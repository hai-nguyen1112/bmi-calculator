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
    @record[:difference_between_ideal_weight] = @record.difference_between_ideal_weight
    @record[:goal] = @record.goal
    if @record[:status] == 'Healthy weight'
      @record[:cals_to_burn_per_day] = nil
    else
      @record[:cals_to_burn_per_day] = @record.cals_to_burn_per_day
    end
    @record[:cals_to_consume_per_day] = @record.cals_to_consume_per_day
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
