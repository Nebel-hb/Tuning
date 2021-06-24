class Public::RecruitInstrumentsController < ApplicationController

  def new
    @recruit_relation = recruit_relation_params[:recruit_relation]
    @recruit_instrument = RecruitInstrument.new
    @recruit_instruments = RecruitInstrument.all
  end

  def create
    puts "================="
    @recruit_instrument = RecruitInstrument.new(recruit_instrument_params)
    @recruit_instrument.save
    redirect_to request.referer
  end

  def destroy
    @recruit_instrument = RecruitInstrument.find(params[:id])
    @recruit_instrument = RecruitInstrument.destroy
    redirect_to request.referer
  end

  def recruit_instrument_params
    params.permit(:instrument_id, :recruit_relation_id, :need_people)
  end

  def recruit_relation_params
    params.require(:recruit_relation).permit(:user_id, :recruitment_id, :event_id)
  end

end
