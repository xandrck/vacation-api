class V1::UsersController < ApplicationController
  def index
    users = User.all
    response = []

    if users.any?
      response = users.map do |user|
        {
          name: "#{user.first_name} #{user.last_name}",
          days: user.vacations_days_left
        }
      end
    end

    render json: response, status: 200
  end
end
