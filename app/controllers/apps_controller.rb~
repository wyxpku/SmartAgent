class AppsController < ApplicationController
  def index
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
   @app = current_user.apps.build(app_params)
  if @app.save
    redirect_to pages_myapps_path, notice: 'Create an App!'
  else
    render pages_createapp_path
  end
end

private

def app_params
  params.require(:app).permit(:name)
end


end


