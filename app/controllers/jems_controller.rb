class JemsController < ApplicationController

  def new
    @jem = Jem.new
  end

  def create
    @jem = Jem.new(jem_params)

    respond_to do |format|
      if @jem.save
        begin
          `RAILS_ENV=#{Rails.env.to_s} bundle exec rails generate gemify #{@jem.id}`
        rescue Exception => e
          logger.info "#{e.inspect}"
        end

        format.html { redirect_to @jem, notice: 'Jem was successfully created.' }
        format.json { render json: @jem, status: :created, location: @jem }
      else
        format.html { render action: "new" }
        format.json { render json: @jem.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @jems = Jem.all
  end

  private

  def jem_params
    params.require(:jem).permit(:github_link, :name)
  end
end
