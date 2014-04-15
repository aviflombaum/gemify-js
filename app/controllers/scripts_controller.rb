class ScriptsController < ApplicationController

  def create
    @script = Jem.find(params[:id]).scripts.create(file: params[:script][:file])
    @jem = Jem.find(params[:id])
    track_activity(@jem, @script, current_user)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @script = Script.find(params[:id])
    @jem = Jem.find(@script.jem_id)
    track_activity(@jem, @script, current_user)
    @script.destroy
    respond_to do |format|
      format.js
    end
  end


end