class PagesController < ApplicationController
  def start
    if signin?
      render :index
    end

  end
  def index
  end
  def location
  end
  def myapps
    @apps = current_user.apps.all
  end
  def createapp
    @app = current_user.apps.build
  end
  def viewapps
  end
  def resources
  end
  def developer
  end
  def pages_myaccount
  end
end
