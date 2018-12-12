class Api::V1::ShiftsController < ApplicationController

  def index
    @shifts = Shift.all
    # p @shifts.to_json
    render json: @shifts, status: :ok
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.save!

    render json: @shift.as_json(title: @shift.title, start_time: @shift.start_time, end_time: @shift.end_time), status: :created
  end

  def destroy
    @shift = Shift.find(1)
    if @shift.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def shift_params
    params.permit(:title, :start_time, :end_time).merge(user_id: 1)
  end
end