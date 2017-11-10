class V1::UsersController < ApplicationController
  def index
    users = User.all
    response = []

    if users.any?
      response = users.map do |user|
        {
          id: user.id,
          name: user.full_name,
          days: user.vacations_days_left
        }
      end
    end

    render json: response, status: 200
  end

  def show
    response = []
    status = 200
    user = User.find(params[:id])

    if user.nil?
      status = 404
    else
      response = user.vacations.map do |vacation|
        {
          start_date: vacation.start_date.to_date,
          end_date: vacation.end_date.to_date,
          days: vacation.days
        }
      end
    end

    render json: response, status: status
  end
end
