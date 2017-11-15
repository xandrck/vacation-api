class Vacation < ApplicationRecord
  belongs_to :user

  validates_presence_of :start_date, :end_date, :user_id
  validate :available_days
  before_create :set_vacation_days_count

  # Default days count once a year
  AVAILABLE_DAYS_COUNT = 21

  private

  def milliseconds_to_days(milliseconds)
    (milliseconds / (24 * 60 * 60)).to_i
  end

  # get vacation's days count
  def set_vacation_days_count
    self.days = milliseconds_to_days(end_date - start_date)
  end

  def available_days
    available_days = user.vacations_days_left - milliseconds_to_days(end_date - start_date)
    errors.add(:days, 'count are more then available for vacation') if available_days <= 0
  end
end
