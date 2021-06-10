class Public::EventsController < ApplicationController

  def index
    events = Event.where("events.end > ?", DateTime.now).reorder(:end)
    @tag_list = Tag.all
    @event = current_user.events.new
    @p = Tag.ransack(params[:q])
    @tag_search = @p.result(distinct: true)
    @q = events.ransack(params[:q])
    @event_search = @q.result(distinct: true)
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
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
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
      redirect_to events_path
    else
       redirect_back(fallback_location: events_path)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @event_tag = @tag.events.all
    @events = Event.all
    @q = Event.ransack(params[:q])
    # @events = @q.result(distinct: true)
    #クリックしたタグに紐付けられた投稿を全て表示
  end

 private

  def event_params
    params.require(:event).permit(:title, :area_id, :user_id, :event_introduction, :start, :end, :event_image)
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
