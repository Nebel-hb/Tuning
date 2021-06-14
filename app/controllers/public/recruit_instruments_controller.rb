class Public::RecruitInstrumentsController < ApplicationController

  def new
    @recruitment = recruitment_params[:recruitment]
    p recruitment_params[:recruitment]
    
    puts "============================="
    p @recruitment
    @recruit_instrument = RecruitInstrument.new
    @recruit_instruments = RecruitInstrument.all
  end

  def create
    @recruit_instrument = RecruitInstrument.new(recruit_instrument_params)
    # @recruit_instrument.recruitment_id = @recruitment.id
    @recruit_instrument.save
    puts "=============="
    p @recruit_instrument
    redirect_to request.referer

  end

  def destroy
    @recruit_instrument = RecruitInstrument.find(params[:id])
    @recruit_instrument = RecruitInstrument.destroy
    redirect_to request.referer
  end

  # def recruitment_params
  #   params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end, :instrument_id)
  # end

  def recruit_instrument_params
    params.permit(:instrument_id, :recruitment_id, :need_people)
  end

  def recruitment_params
    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end, :instrument_id)
  end

end
