class GymController < ApplicationController
  before_action :authenticate_gym!

  def profile
  end

  def address
  end

  def change_address
    @gym = current_gym
    result = RestClient::Request.execute(
      method: :get,
      url: 'https://geocoder.api.here.com/6.2/geocode.json?searchtext=' + add_params["address"] + '&app_id=A3k50ziCbuDE8NVHU1lr&app_code=PfpBfdphIFeJ0zMC2cq1Pw'
    )
    data = JSON.parse(result, symbolize_keys: true)
    coordinates = data["Response"]["View"][0]["Result"][0]["Location"]["DisplayPosition"]
    @gym.address = add_params["address"]
    @gym.latitude = coordinates["Latitude"]
    @gym.longitude = coordinates["Longitude"]

    respond_to do |format|
      if @gym.save
        format.html { redirect_to controller: 'gym', action: 'profile', notice: 'Address successfully updated' }
        format.json { render 'gym/profile', status: :ok, location: @gym }
      else
        format.html { render 'gym/profile' }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_courses
    @courses = current_gym.courses
  end

  def my_coupons
    @coupons = current_gym.coupons
  end

  def my_worksheets
    @worksheets = current_gym.worksheets
  end

  protected
  # Never trust parameters from the scary internet, only allow the white list through.
  def add_params
    params.permit(:address)
  end

end
