class Public::RecruitmentsController < ApplicationController
before_action :authenticate_user!
  def index
    @recruit_relation = RecruitRelation.new
    @search_past = params[:search_past]

    if  @search_past == "開催予定のイベント"
      @recruit = Recruitment.where("recruitments.recruit_end > ?", DateTime.now).reorder(:end)
    elsif @search_past == "過去のイベント"
      @recruit = Recruitment.where("recruitments.recruit_end < ?", DateTime.now).reorder(:end)
    else
      @recruit = Recruitment.all
    end

    @q =  @recruit.ransack(params[:q])
    @recruitments = @q.result(distinct: true).includes(:area, :user).page(params[:page]).per(5)

  end

  def new
    @recruit_relation  = RecruitRelation.find(params[:recruit_relation])
    @recruit_instrument = RecruitInstrument.new
    @recruitment = Recruitment.new
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: @recruit_relation.id).includes(:instrument)
    @event = Event.new

  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruit_users = RecruitUser.all
    @recruit_user = RecruitUser.where(recruitment_id: @recruitment.id )
    @count = RecruitUser.where(recruitment_id: @recruitment.id , join: 1).count
    @recruitment_user = RecruitUser.find_by(recruitment_id: @recruitment.id, user_id: current_user.id)
    @recruit_relation = RecruitRelation.find_by(recruitment_id: @recruitment.id)
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: @recruit_relation).includes(:instrument)
    @find_all = @recruit_instruments.where(find_all: false)
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
    @recruit_relation  = RecruitRelation.find_by(recruitment_id: @recruitment.id)
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: @recruit_relation.id)

  end

  def update
    @recruitment = Recruitment.find(params[:id])
    recruit_relation  = RecruitRelation.find_by(recruitment_id: @recruitment.id)
    if @recruitment.update(recruitment_params)
      with_event = params[:with_event]
      if with_event == "true"
        event = Event.new
        event.title =  @recruitment.title
        event.user_id =  @recruitment.user_id
        event.area_id = @recruitment.area_id
        event.event_introduction = @recruitment.recruit_introduction
        event.start = @recruitment.recruit_event_start
        event.end = @recruitment.recruit_event_end
        event.save
        recruit_relation.update(event_id: event.id)
      end
      redirect_to recruitment_path(@recruitment.id)
    else
      render 'edit'
    end
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    recruit_relation  = RecruitRelation.find_by(id: params[:recruit_relation])
    if @recruitment.save
      recruit_relation.recruitment_id = @recruitment.id
     with_event = params[:with_event]
      if with_event == "true"
        event = Event.new
        event.title =  @recruitment.title
        event.user_id =  @recruitment.user_id
        event.area_id = @recruitment.area_id
        event.event_introduction = @recruitment.recruit_introduction
        event.start = @recruitment.recruit_event_start
        event.end = @recruitment.recruit_event_end
        event.save
        recruit_relation.update(event_id: event.id)
      end
        recruit_relation.update(recruitment_id: @recruitment.id )
        redirect_to recruitment_path(@recruitment.id)
    else
      redirect_to request.referer
      flash[:notice] = "全ての項目を正しく入力してください"
      # render 'new'
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to recruitments_path
  end

  def confirm
    @recruitment = Recruitment.find(params[:id])
    @recruit_user = RecruitUser.new
    @thank_you_comment = ThankYouComment.new
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: RecruitRelation.find_by(recruitment_id: @recruitment).id).pluck(:instrument_id)
    @instruments = Instrument.where(id: @recruit_instruments)
  end

private
  def recruitment_params
    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end, :instrument_id)
  end
  def recruit_relation_params
    # params.require(:recruit_relation)
    params.permit(:recruit_relation)
  end

  def recruit_instrument_params
    params.require(:recruit_instrument).permit(:instrument_id, :recruit_relation_id, :need_people)
  end

  def with_event_params
    params.permit(:with_event)
  end
end
