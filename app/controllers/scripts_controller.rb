class ScriptsController < ApplicationController
  # def create
  #   binding.pry
  #   @script = Jem.find(params[:id]).scripts.new(file: params[:file])
  #   if @script.save!
  #   respond_to do |format|
  #     format.json{ render :json => @script }
  #   end
  #   end
  # end

  def create
    @script = Jem.find(params[:id]).scripts.create(file: params[:script][:file])

    respond_to do |format|
      format.js
    end
  end

  def show
    @script = Jem.find(params[:id]).scripts.find(params[:script_id])
  end

end