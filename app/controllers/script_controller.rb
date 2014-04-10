class ScriptController < ApplicationController
  def create
    binding.pry
    @script = Jem.find(params[:id]).scripts.new(file: params[:file])
    if @script.save!
    respond_to do |format|
      format.json{ render :json => @script }
    end
    end
  end
end