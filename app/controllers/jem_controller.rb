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


  private

  def jem_params
    params.require(:jem).permit(:github, :name)
  end
end
