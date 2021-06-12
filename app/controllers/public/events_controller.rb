class Public::EventsController < ApplicationController

  def index
    if  @search_past == "開催予定のイベント"
      @event_search = Event.where("events.end > ?", DateTime.now).reorder(:end)
    elsif @search_past == "過去のイベント"
      @event_search = Event.where("events.end < ?", DateTime.now).reorder(:end)
    else
      @event_search = Event.all
    end
    
    # events = Event.where("events.end > ?", DateTime.now).reorder(:end)
    @tag_list = Tag.all
    @event = current_user.events.new
    
    @q = @event_search.ransack(params[:q])
    @events = @q.result(distinct: true)
    # @tags = Tag.where(id:  (EventTag.where(event_id: @events.pluck(:event_id))).pluck(:tag_id))
    @tags = Tag.all
    # puts "======================="
    # p @tags
    @areas = Area.all


  #   @search = params[:search]
  #   @word = params[:word]
  #   @event_params = [params[:word],params[:area],params[:end_gteq],params[:start_lteq]]
  #   @search_past = params[:search_past]

  # # 　if search_all == "1"

  #   @events_all = Event.all
  #   @areas = Area.all
  #   if  @search == "イベント検索"
  #     @events = @event.search_event(@event_params,@search,@event)
  #     @tags = Tag.all
  #   elsif @search == "募集者検索"
  #     event_user = User.search_user(@word).pluck(:id)
  #     @events = @event.where(user_id: event_user)
  #     @tags = Tag.all
  #   elsif @search == "タグ検索"
  #     @tags = Tag.search_tag(@word,@search)
  #     tag = @tags.pluck(:id)
  #     @events = @event.where(id: EventTag.where(tag_id: tag).pluck(:event_id))
  #   else
  #     @tags = Tag.all
  #     @events = @event
  #   end

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
