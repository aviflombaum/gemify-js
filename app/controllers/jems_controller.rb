class JemsController < ApplicationController

  def new
    @jem = Jem.new
  end

  def create
    @jem = Jem.new(jem_params)
    respond_to do |format|
     if @jem.save
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
    @script = Script.new
    @jem = Jem.find(params[:id])
  end

  def gemify_jem
    @jem = Jem.find(params[:id].to_i)

    if @jem.scripts. # NOT DONE
    `RAILS_ENV="#{Rails.env.to_s}" rails g gemify #{@jem.id}`
    redirect_to @jem
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
    params.require(:jem).permit(:github, :name, :description, :author, :summary, :homepage, :version_number, :email)
  end
end
