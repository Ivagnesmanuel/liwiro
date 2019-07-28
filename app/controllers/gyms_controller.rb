class GymsController < ApplicationController

  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  # PATCH/PUT /gyms/:id/join
  def join
    @gym = set_gym
    if !(@gym.already_joined(@gym,current_athlete))
      current_athlete.gyms.push(@gym)
      respond_to do |format|
        format.html { redirect_to @gym, notice: 'Gym was successfully joined.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @gym, notice: 'Gym was already joined.' }
      end
    end
  end

  # PATCH/PUT /gyms/:id/leave
  def leave
    @gym = set_gym
    if (@gym.already_joined(@gym,current_athlete))
      current_athlete.gyms.delete(@gym)
      respond_to do |format|
        format.html { redirect_to @gym, notice: 'Gym was successfully left.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @gym, notice: 'Gym was not already joined.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym
      @gym = Gym.find(params[:id])
    end

end
