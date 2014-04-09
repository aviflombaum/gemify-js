class JemsController < ApplicationController

  def new
    @jem = Jem.new
  end

  def create
    @jem = Jem.new(jem_params)
  end

  def index
    @jems = Jem.all
  end

  private

  def jem_params
    params.require(:jem).permit(:github_link, :name)
  end
end
