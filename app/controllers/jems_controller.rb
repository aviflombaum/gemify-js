class JemsController < ApplicationController

  def new
    @jem = Jem.new
  end

  def create
    @jem = Jem.new(jem_params)
    @jem.user_id = current_user.id
    respond_to do |format|
      if @jem.save
        format.html { redirect_to @jem, notice: 'Jem was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def index
    @jems = current_user.jems
  end

  def show
    @script = Script.new
    @jem = Jem.find(params[:id])
  end

  def gemify_jem
    @jem = Jem.find(params[:id].to_i)
    if @jem.has_files?
      @job_id = JemWorker.perform_async(@jem.id)

      respond_to do |format|
        format.js
      end
    end
  end

  def percentage_done
    job_id = params[:job_id]

    container = SidekiqStatus::Container.load(job_id)

    @pct_complete = container.pct_complete
    @job_message = Jem.get_message(@pct_complete)

    respond_to do |format|
      format.json { 
        render :json => {
          :percentage_done => @pct_complete,
          :job_message => @job_message
        }
      }
    end
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
