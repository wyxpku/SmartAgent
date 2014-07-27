class AppsController < ApplicationController
  def index
  end

  def destroy
    @app = current_user.apps.find(params[:id])
    if @app.destroy
      redirect_to myapps_path, notice: 'Delete an App!'
    else
      render myapps_path
    end
  end

  def create
   @app = current_user.apps.build(app_params)
  if @app.save
    redirect_to myapps_path, notice: 'Create an App!'
  else
    render createapp_path
  end
end

private

def app_params
  params.require(:app).permit(:name)
end


end


