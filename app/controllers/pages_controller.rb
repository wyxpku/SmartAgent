class PagesController < ApplicationController
  def start
    if signin?
      render :index
    end
  end
  def index
		if signin?
			@apps = current_user.apps.all
			render :index
		end
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
  	@apps = App.all
	end
  def resources
    @sensors = Sensor.all
    @actuators = Actuator.all
  end
  def developer
		@sensor = current_user.sensors.build
		@actuator = current_user.actuators.build
		@sensors = current_user.sensors.all
		@actuators = current_user.actuators.all
  end
  def pages_myaccount
  end
end
