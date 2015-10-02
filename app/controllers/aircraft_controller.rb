class AircraftController < ApplicationController
  def index
    render nothing: true
  end

  def new
    @aircraft = Aircraft.new
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)

    if @aircraft.save
      redirect_to @aircraft
    else
      render :new
    end
  end

  def show
    @aircraft = Aircraft.friendly.find(aircraft_params[:id])
  end

  def recently_added
    respond_to do |format|
      format.json {
        render nothing: true
      }
    end
  end

  private

  def aircraft_params
    params[:aircraft].permit(:name, :conceived_at, :flown_at, :introduced_at, :retired_at, :produced_since,
                             :produced_till, :number_built)
  end
end
