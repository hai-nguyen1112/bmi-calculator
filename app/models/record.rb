class Record < ActiveRecord::Base
  belongs_to :user
  validates :weight, presence: true, numericality: {greater_than: 0, only_number: true}
  validates :height_ft, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 6, only_integer: true}
  validates :height_in, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 11, only_integer: true}
  validates :age, presence: true, numericality: {greater_than: 0, only_integer: true}

  def bmi_cal
    (self.weight.to_f/(self.height_ft.to_f*12 + self.height_in.to_f)/(self.height_ft.to_f*12 + self.height_in.to_f)*703).round(1).to_s
  end

  def height
    (self.height_ft.to_f*12 + self.height_in.to_f).round(1)
  end

  def bmi_status
    bmi_f = self.bmi.to_f
    if bmi_f < 18.5
      return "Under weight"
    elsif bmi_f >= 18.5 && bmi_f <= 25
      return "Healthy weight"
    else
      return "Over weight"
    end
  end

  def bmi_risk
    if self.status == "Under weight"
      return "Risk of developing problems such as nutritional deficiency and osteoporosis."
    elsif status == 'Over weight'
      return "Moderate to high risk of developing heart disease, high blood pressure, stroke and diabetes."
    else
      return "Healthy, normal range."
    end
  end

  def ideal_weight
    if self.sex == 'm'
      return (50 * 2.2 + ((2.3 * 2.2) * (self.height - 60))).to_i
    else
      return (45.5 * 2.2 + ((2.3 * 2.2) * (self.height - 60))).to_i
    end
  end

  def difference_between_ideal_weight
    (self.ideal_weight.to_f -  self.weight.to_f).to_i
  end

  def bmr
    if self.sex == 'm'
    ((4.5 * self.weight.to_f) + (15.9 * self.height) - (5 * self.age.to_f) + 5).to_i
    else
    ((4.5 * self.weight.to_f) + (15.9 * self.height) - (5 * self.age.to_f) - 161).to_i
    end
  end

  def goal
    self.difference_between_ideal_weight.abs
  end

  def cals_to_burn_per_day
    500
  end

  def cals_to_consume_per_day
    if self.sex == 'm'
      if self.status == 'Over weight' || self.status == "Healthy weight"
        return 2500
      else self.status == 'Under weight'
        return 3000
      end
    elsif self.sex == 'f'
      if self.status == 'Over weight' || self.status == "Healthy weight"
        return 2000
      else self.status == 'Under weight'
        return 2500
      end
    end
  end

end

