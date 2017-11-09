class Vacation < ApplicationRecord
  belongs_to :user

  # Default days count once a year
  AVAILABLE_DAYS_COUNT = 21
end
