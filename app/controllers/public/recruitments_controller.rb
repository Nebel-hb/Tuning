class Public::RecruitmentsController < ApplicationController
before_action :authenticate_user!
before_action :set_recruitment, only: [:show, :edit, :update, :destroy, :confirm]

  def index
    @recruit_relation = RecruitRelation.new
    @q = Recruitment.search_time(params[:search_past]).ransack(params[:q])
    @recruitments = @q.result(distinct: true).includes(:area, :user).page(params[:page]).per(5)
  end

  def new
    set_relation_params
    @recruit_instrument = RecruitInstrument.new
    @recruitment = Recruitment.new
    @event = Event.new
  end

  def show
    set_relation
    @recruit_users = RecruitUser.all
    @recruit_user = RecruitUser.where(recruitment_id: @recruitment)
    @count = RecruitUser.where(recruitment_id: @recruitment, join: 1).count
    @recruitment_user = RecruitUser.find_by(recruitment_id: @recruitment, user_id: current_user)
    @find_all = @recruit_instruments.where(find_all: false)
  end

  def edit
    set_relation
  end

  def update
    set_relation
    if @recruitment.update(recruitment_params)
      if params[:with_event] == "true"
        @event = Event.new
        set_recruit_event
        @event.save
        @recruit_relation.update(event_id: @event.id)
      elsif params[:change_event] == "true"
        Event.find(@recruit_relation.event_id).update(
          title: @recruitment.title,
          user_id: @recruitment.user_id,
          area_id: @recruitment.area_id,
          event_introduction: @recruitment.recruit_introduction,
          start: @recruitment.recruit_event_start,
          end: @recruitment.recruit_event_end)
      end
      redirect_to recruitment_path(@recruitment.id)
    else
      render 'edit'
    end
  end

  def create
    set_relation_params
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      if with_event = params[:with_event] == "true"
        @event = Event.new
        set_recruit_event
        @event.save
        @recruit_relation.update(event_id: @event.id)
      end
        @recruit_relation.update(recruitment_id: @recruitment.id )
        redirect_to recruitment_path(@recruitment.id)
    else
      redirect_to request.referer
      flash[:notice] = "全ての項目を正しく入力してください"
    end
  end

  def destroy
    @recruitment.destroy
    redirect_to recruitments_path
  end

  def confirm
    set_relation
    @recruit_user = RecruitUser.new
    # @thank_you_comment = ThankYouComment.new
    @instruments = Instrument.where(id: @recruit_instruments.pluck(:instrument_id))
  end

private
  def recruitment_params
    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end, :instrument_id)
  end
  def recruit_relation_params
    params.permit(:recruit_relation)
  end

  def recruit_instrument_params
    params.require(:recruit_instrument).permit(:instrument_id, :recruit_relation_id, :need_people)
  end

  def with_event_params
    params.permit(:with_event)
    params.permit(:change_event)
  end

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end
  def set_relation
    @recruit_relation  = RecruitRelation.find_by(recruitment_id: @recruitment)
    set_recruit_instrument
  end
  def set_relation_params
    @recruit_relation  = RecruitRelation.find(params[:recruit_relation])
    set_recruit_instrument
  end
  def set_recruit_instrument
    @recruit_instruments = RecruitInstrument.where(recruit_relation_id: @recruit_relation).includes(:instrument)
  end
  def set_recruit_event
    @event.title =  @recruitment.title
    @event.user_id =  @recruitment.user_id
    @event.area_id = @recruitment.area_id
    @event.event_introduction = @recruitment.recruit_introduction
    @event.start = @recruitment.recruit_event_start
    @event.end = @recruitment.recruit_event_end
  end
end
