class PagesController < ApplicationController
  def start
    if signin?
      render :index
    end
  end
  def index
    @apps = current_user.apps.all
  end
  def location
  end
  def myapps
    if signin?
      @apps = current_user.apps.all
    end
  end

  def createapp
    @app = current_user.apps.build()
    #important to initalize the session[:app]
    session[:app] = Hash.new unless session[:app]
  end


  def viewapps
  end
  def resources
    @sensors = Sensor.all
    @actuators = Actuator.all
  end
  def developer
		@sensor = Sensor.new
		@actuator = Actuator.new
		@sensors = current_user.sensors
		@actuators = current_user.actuators
  end
  def pages_myaccount
  end
end
