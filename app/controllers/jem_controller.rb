class JemController < ApplicationController

  def new
    @jem = Jem.new
  end

  def create
    @jem = Jem.new(jem_params)
    respond_to do |format|
     if @jem.save
       params[:scripts]['file'].each do |a|
          @scripts = @jem.scripts.create!(:file => a, :jem_id => @jem.id)
       end
       format.html { redirect_to @jem, notice: 'Jem was successfully created.' }
     else
       format.html { render action: 'new' }
     end
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
      redirect_to jem_path(@jem)
    else
      render :new
    end
  end

  private

  def jem_params
    params.require(:jem).permit(:github, :name)
  end
end
