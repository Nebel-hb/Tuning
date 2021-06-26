class Public::RecruitInstrumentsController < ApplicationController
before_action :authenticate_user!
  def new
    @recruit_relation = recruit_relation_params[:recruit_relation]
    @recruit_instrument = RecruitInstrument.new
    @recruit_instruments = RecruitInstrument.all
  end

  def create
    @recruit_instrument = RecruitInstrument.new(recruit_instrument_params)
    recruit_relation = RecruitRelation.where(id: @recruit_instrument.recruit_relation_id).pluck(:id)
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: recruit_relation)
    same_product = false
    id = 0
    @recruit_instruments.each do |recruit_instrument|
      if recruit_instrument.instrument_id == recruit_instrument_params[:instrument_id].to_i
        same_product = true
        id = recruit_instrument.id
      end
    end
    if same_product
      recruit_instrument = RecruitInstrument.find(id)
      update_need_people = recruit_instrument.need_people.to_i + recruit_instrument_params[:need_people].to_i
      recruit_instrument.update_attributes(need_people: update_need_people)
      redirect_to request.referer
    else
      @recruit_instrument = RecruitInstrument.new(recruit_instrument_params)
      if  @recruit_instrument.save
        redirect_to request.referer
      else
        redirect_to request.referer
        flash[:notice] = "人数を選択してください"
      end
    end
  end
  
  def update
    @recruit_instrument = RecruitInstrument.find(params[:id])
    @recruit_instrument.update(recruit_instrument_params)
    redirect_to request.referer
  end

  def destroy
    @recruit_instrument = RecruitInstrument.find(params[:id])
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

end
