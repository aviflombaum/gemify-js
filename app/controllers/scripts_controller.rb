class ScriptsController < ApplicationController

  def create
    @script = Jem.find(params[:id]).scripts.create(file: params[:script][:file])

    respond_to do |format|
      format.js
    end
  end

  def show
    @script = Jem.find(params[:id]).scripts.find(params[:script_id])
  end

  def destroy
    @script = Script.find(params[:id])
    @jem = Jem.find(@script.jem_id)
    @script.destroy
    respond_to do |f|
      f.js
    end
  end


end