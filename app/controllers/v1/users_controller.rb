class V1::UsersController < ApplicationController
  def index
    users = User.all
    users = users.map { |user| "#{user.first_name} #{user.last_name}" } if users.any?

    render json: users, status: 200
  end
end
