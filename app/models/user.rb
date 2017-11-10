class User < ApplicationRecord
  has_many :vacations

  validates_presence_of :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def vacations_days_left
    Vacation::AVAILABLE_DAYS_COUNT - vacations.sum(:days)
  end
end
