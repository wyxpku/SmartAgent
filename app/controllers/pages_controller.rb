class PagesController < ApplicationController
  def start
    if signin?
      render :createapp
    end
  end
  def index
  end
  def location
  end
  def myapps
    if signin?
      @apps = current_user.apps.all
    end
  end
  def createapp
    if signin?
      @app = current_user.apps.build
    end
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
