class AppsController < ApplicationController
  def index
  end

  def destroy
    @app = current_user.apps.find(params[:id])
    if @app.destroy
<<<<<<< HEAD
      redirect_to myapps_path, notice: 'Delete an App!'
    else
      render myapps_path
=======
      redirect_to pages_myapps_path, notice: 'Delete an App!'
    else
      render pages_myapps_path
>>>>>>> c9c71db62280f902060ec0e2387ec4db1a05a128
    end
  end

  def create
   @app = current_user.apps.build(app_params)
  if @app.save
<<<<<<< HEAD
    redirect_to myapps_path, notice: 'Create an App!'
  else
    render createapp_path
=======
    redirect_to root_path, notice: 'Create an App!'
  else
    render root
>>>>>>> c9c71db62280f902060ec0e2387ec4db1a05a128
  end
end

private

def app_params
  params.require(:app).permit(:name)
end


end


