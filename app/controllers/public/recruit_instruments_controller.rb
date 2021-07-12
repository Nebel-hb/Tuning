class Public::RecruitInstrumentsController < ApplicationController
before_action :authenticate_user!
before_action :set_reinstrument, only: [:update, :destroy]

  def new
    @recruit_relation = recruit_relation_params[:recruit_relation]
    @recruit_instrument = RecruitInstrument.new
    @recruit_instruments = RecruitInstrument.all
  end

  def create
    @recruit_instrument = RecruitInstrument.new(recruit_instrument_params)
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: @recruit_instrument.recruit_relation_id)
    @recruit_instruments.each do |recruit_instrument|
      if recruit_instrument.instrument_id == @recruit_instrument.instrument_id
        update_need_people = RecruitInstrument.find(recruit_instrument.id).need_people.to_i + @recruit_instrument.need_people
        recruit_instrument.update_attributes(need_people: update_need_people)
        redirect_to request.referer
        return
      end
    end
    if  @recruit_instrument.save
      redirect_to request.referer
    else
      redirect_to request.referer
      flash[:notice] = "人数を選択してください"
    end
  end

  def update
    @recruit_instrument.update(recruit_instrument_params)
    redirect_to request.referer
  end

  def destroy
    @recruit_instrument.destroy
    redirect_to request.referer
  end

  def destroy_all
    recruit_relation  = RecruitRelation.find_by(id: params[:recruit_relation])
    recruit_instrument = RecruitInstrument.where(recruit_relation_id: recruit_relation.id)
    recruit_instrument.destroy_all
    redirect_to request.referer
  end

  private

  def recruit_instrument_params
    params.permit(:instrument_id, :recruit_relation_id, :need_people)
  end

  def recruit_relation_params
    params.permit(:recruit_relation)
  end

  def set_reinstrument
    @recruit_instrument = RecruitInstrument.find(params[:id])
  end

end
