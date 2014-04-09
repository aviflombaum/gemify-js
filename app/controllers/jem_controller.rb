class JemController < ApplicationController

  def new
    @jem = Jem.new
  end

  def create
    @jem = Jem.new(jem_params)
    if @jem.save
      redirect_to @jem
    else
      render :new
    end
  end

  def index
    @jems = Jem.all
  end

  def show
    @jem = Jem.find(params[:id])
  end

  def update
    @jem = Jem.find(params[:id])
    if @jem.update_attributes(jem_params)
      respond_to do |format|
        format.json{ render :json => @jem }
      end
    end
  end

  private

  def jem_params
    params.require(:jem).permit(:github, :name, :script)
  end
end
