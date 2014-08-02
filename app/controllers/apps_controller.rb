class AppsController < ApplicationController
  def index
  end

  def confirm
    respond_to do |format|
      format.js
    end
  end

  def query
    @app = User.find(params[:user_id]).apps.find(params[:app_id])
    render json: @app
  end

  def destroy
    @app = current_user.apps.find(params[:id])
    if @app.destroy
      redirect_to pages_myapps_path, notice: 'Delete an App!'
    else
      render pages_myapps_path
    end
  end

  def create
    puts session[:app]
    @app = current_user.apps.build()
    @app.sensor_id = session[:app]["sensor"]["sensorid"]
    @app.actuator_id = session[:app]["actuator"]["actuatorid"]
    @app.sensor_params = session[:app]["sensor"]["condition"].to_s
    @app.actuator_params = session[:app]["actuator"]["params"].to_s

    render json: session[:app] 
  end

  private

  def app_params
    params.require(:app).permit(:name)
  end


end


