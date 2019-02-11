class Record < ActiveRecord::Base
  belongs_to :user
  validates :weight, presence: true, numericality: {greater_than: 0, only_number: true}
  validates :height_ft, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 6, only_integer: true}
  validates :height_in, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 11, only_integer: true}
  validates :age, presence: true, numericality: {greater_than: 0, only_integer: true}

  def bmi_cal(weight, height_ft, height_in)
    (weight.to_f/(height_ft.to_f*12 + height_in.to_f)/(height_ft.to_f*12 + height_in.to_f)*703).round(1).to_s
  end

  def height(height_ft, height_in)
    (height_ft.to_f*12 + height_in.to_f).round(1)
  end

  def bmi_status(bmi)
    bmi_f = bmi.to_f
    if bmi_f < 18.5
      return "Under weight"
    elsif bmi_f >= 18.5 && bmi_f <= 25
      return "Healthy weight"
    else
      return "Over weight"
    end
  end

  def bmi_risk(status)
    if status == "Under weight"
      return "Risk of developing problems such as nutritional deficiency and osteoporosis."
    elsif status == 'Over weight'
      return "Moderate to high risk of developing heart disease, high blood pressure, stroke and diabetes."
    else
      return "Healthy, normal range."
    end
  end

  def ideal_weight(height, sex)
    if sex == 'm'
      return (50 * 2.2 + 2.3 * (height - 60)).to_i.to_s
    else
      return (45.5 * 2.2 + 2.3 * (height - 60)).to_i.to_s
    end
  end

  def ideal_weight_difference(ideal_weight, weight)
    if ideal_weight.to_f > weight.to_f
      return (ideal_weight.to_f - weight.to_f).to_i.to_s
    else
      return (weight.to_f - ideal_weight.to_f).to_i.to_s
    end
  end

end
