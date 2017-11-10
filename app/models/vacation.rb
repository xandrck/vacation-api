class Vacation < ApplicationRecord
  belongs_to :user

  validates_presence_of :start_date, :end_date
  before_create :set_vacation_days_count

  # Default days count once a year
  AVAILABLE_DAYS_COUNT = 21

  private

  # get vacation's days count
  def set_vacation_days_count
    self.days = ((end_date - start_date) / (24 * 60 * 60)).to_i
  end
end
