class RunsController < ApplicationController
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError do
    puts "Need to login"
    redirect_to "/auto_login", alert: "You do not have the permission to access this section"
  end

  def index
    @runs = Run.all
    # authorize @runs
    respond_to do |format|
      format.json {render json: @runs}
    end
  end

  def create
    puts params[:_json]
    @run = Run.new(run_params)
    # authorize @run
    hours_minutes = run_params[:time].to_s.split
    average_speed = run_params[:distance] / (hours_minutes[0].to_f + hours_minutes[1].to_f / 60)
    @run.average_speed = average_speed
    respond_to do |format|

      if @run.save
        format.json { render json: { "OK": true } }
      else
        format.json { render json: { "OK": false } }
      end

    end
  end

  def show
    set_run
    respond_to do |format|
      format.json {render json: @run}
    end
  end

  def update
    # authorize @run
    respond_to do |format|
      if @run.update(run_params)
        format.json { render :show, status: :ok, location: @run }
      else
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @run
    @run.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = Run.find(params[:id])
    # authorize @run
  end

  # Only allow a list of trusted parameters through.
  def run_params
    params.require(:run).permit(:date, :distance, :time)
  end
end


