class PagesController < ApplicationController
  def start
  end
  def index
  end
  def location
  end
  def myapps
    if login?
      @apps = current_user.apps.all
    end
  end
  def createapp
    if login?
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
