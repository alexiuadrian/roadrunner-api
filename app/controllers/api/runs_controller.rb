class Api::RunsController < Api::BaseController

  before_action :authenticate_user!

  def index
    @runs = Run.all
    respond_to do |format|
      format.json {render json: @runs}
    end
  end

  def create
    puts params[:_json]
    @run = Run.new(run_params)
    hours_minutes = run_params[:time].to_s.split
    average_speed = run_params[:distance] / (hours_minutes[0].to_f + hours_minutes[1].to_f / 60)
    # puts '------------------------------------'
    # puts run_params[:distance].class
    # puts average_speed
    @run.average_speed = average_speed
    respond_to do |format|

      if @run.save
        format.json { render json: { "OK": true } }
      else
        format.json { render json: { "OK": false } }
      end

    end
  end

  private

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = Run.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def run_params
    params.require(:run).permit(:date, :distance, :time)
  end
end


