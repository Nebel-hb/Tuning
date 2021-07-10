class Public::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_tag, only: [:update, :create]
  
  def index
    @search_past = params[:search_past]

    if  @search_past == "開催予定のイベント"
      @event_search = Event.where("events.end > ?", DateTime.now).endtime
    elsif @search_past == "過去のイベント"
      @event_search = Event.where("events.end < ?", DateTime.now).endtime
    else
      @event_search = Event.all
    end

    @tag_list = Tag.all
    @event = current_user.events.new

    @q = @event_search.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:area, :user).page
    @tags = Tag.all

    @areas = Area.all
  end

  def new
    @event = Event.new
    @tag_list = Tag.where(id: EventTag.where(event_id: Event.where(:id == nil?)).pluck(:tag_id))
  end

  def show
    @comment = Comment.new
    @event_tags = @event.tags
    @recruit_relation = RecruitRelation.find_by(event_id: @event)
  end

  def edit
    @tag = @event.tags
  end

  def update
    if @event.update(event_params)
     @event.save_tag(@tag_list)
      redirect_to event_path(@event.id)
    else
      render 'edit'
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @event.save_tag(@tag_list)

      redirect_to event_path(@event.id)
    else
      redirect_to request.referer
      flash[:notice] = "全ての項目を正しく入力してください"
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    # @events = Event.page(params[:page]).per(5)
    @events = Event.where(id: EventTag.where(tag_id: @tag.id).pluck(:event_id)).page
    @q = Event.ransack(params[:q])
  end

 private

  def event_params
    params.require(:event).permit(:title, :area_id, :user_id, :event_introduction, :start, :end, :event_image)
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
  
   def set_event
    @event = Event.find(params[:id])
  end
  
   def set_tag
    @tag_list = params[:event][:tag_name].split(/[[:blank:]]+/)
  end
end
