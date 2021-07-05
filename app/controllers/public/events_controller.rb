class Public::EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @search_past = params[:search_past]

    if  @search_past == "開催予定のイベント"
      @event_search = Event.where("events.end > ?", DateTime.now).reorder(:end)
    elsif @search_past == "過去のイベント"
      @event_search = Event.where("events.end < ?", DateTime.now).reorder(:end)
    else
      @event_search = Event.all
    end

    @tag_list = Tag.all
    @event = current_user.events.new

    @q = @event_search.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:area, :user).page(params[:page]).per(5)
    @tags = Tag.all

    @areas = Area.all
  end

  def new
    @event = Event.new
    @tag_list = Tag.all
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @event_tags = @event.tags
    @recruit_relation = RecruitRelation.find_by(event_id: @event)
  end

  def edit
    @event = Event.find(params[:id])
    @tag = @event.tags
  end

  def update
    @event = Event.find(params[:id])
    tag_list = params[:event][:tag_name].split(/[[:blank:]]+/)
    if @event.update(event_params)
     @event.save_tag(tag_list)
      redirect_to event_path(@event.id)
    else
      render 'edit'
    end
  end

  def create
    @event = Event.new(event_params)
    tag_list = params[:event][:tag_name].split(/[[:blank:]]+/)
    if @event.save
      @event.save_tag(tag_list)

      redirect_to event_path(@event.id)
    else
      redirect_to request.referer
      flash[:notice] = "全ての項目を正しく入力してください"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @events = Event.page(params[:page]).per(5)
    @events = Event.where(id: EventTag.where(tag_id: @tag.id).pluck(:event_id)).page(params[:page]).per(5)
    @q = Event.ransack(params[:q])
  end

 private

  def event_params
    params.require(:event).permit(:title, :area_id, :user_id, :event_introduction, :start, :end, :event_image)
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
