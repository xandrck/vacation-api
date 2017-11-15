class V1::VacationsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    vacation = user.vacations.new(start_date: params[:start_date], end_date: params[:end_date])
    if vacation.save
      render json: 'success', status: 200
    else
      render json: vacation.errors.full_messages.join(', '), status: 302
    end

  end
end
