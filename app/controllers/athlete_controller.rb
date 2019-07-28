class AthleteController < ApplicationController
  before_action :authenticate_athlete!

  def profile
  end

  def settings
  end

  def change_settings
    @athlete = current_athlete
    @athlete.height = body_params["height"]
    @athlete.weight = body_params["weight"]
    @athlete.age = body_params["age"]

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to controller: 'athlete', action: 'profile', notice: 'body features successfully updated' }
        format.json { render 'athlete/profile', status: :ok, location: @athlete }
      else
        format.html { render 'athlete/profile' }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_gyms
    @gyms = current_athlete.gyms
  end

  def my_courses
    @courses = current_athlete.courses
  end

  def my_coupons
    @coupons = current_athlete.coupons
  end

  def my_worksheets
    @worksheets = current_athlete.worksheets
  end

  protected
  # Never trust parameters from the scary internet, only allow the white list through.
  def body_params
    params.permit(:height, :weight, :age)
  end

end
