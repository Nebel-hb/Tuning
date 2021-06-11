class Public::RecruitmentsController < ApplicationController

  def index
    # @recruitments = Recruitment.where("recruitments.recruit_end > ?", DateTime.now).reorder(:recruit_end)
    @search = params[:search]
    @word = params[:word]
    @recruit_params = [params[:word],params[:area],params[:end_gteq],params[:start_lteq]]
    @search_past = params[:search_past]
    
    if  @search_past == "開催予定のイベント"
      @recruit = Recruitment.where("recruitments.recruit_end > ?", DateTime.now).reorder(:end)
    elsif @search_past == "過去のイベント"
      @recruit = Recruitment.where("recruitments.recruit_end < ?", DateTime.now).reorder(:end)
    else
      @recruit = Recruitment.all
    end

    # @events_all = Recruitment.all
    @areas = Area.all
    if  @search == "イベント検索"
      @recruitments = @recruit.search_recruit(@recruit_params,@search,@recruit)
      @instruments = Instrument.all
    elsif @search == "募集者検索"
      recruit_user = User.search_user(@word).pluck(:id)
      @recruitments = @recruit.where(user_id: recruit_user)
      @instruments = Instrument.all
    elsif @search == "楽器検索"
      @instruments = Instrument.search_instrument(@word,@search)
      instrument = @instruments.pluck(:id)
      @recruitments = @recruitment.where(id: EventTag.where(instrument_id: instrument).pluck(:recruitment_id))
    else
      @instruments = Instrument.all
      @recruitments = @recruit
    end

    
    
  end
  def new
     @recruitment = Recruitment.new
     @event = Event.new
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruit_users = RecruitUser.all
    @recruit_user = RecruitUser.where(recruitment_id: @recruitment.id )
    @count = RecruitUser.where(recruitment_id: @recruitment.id , join: false).count
    @recruitment_user = RecruitUser.find_by(recruitment_id: @recruitment.id, user_id: current_user.id)

  end

  def edit
     @recruitment = Recruitment.find(params[:id])
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
      redirect_to recruitment_path(@recruitment.id)
    else
      render 'edit'
    end
  end

  def create
    
     @recruitment = Recruitment.new(recruitment_params)
     event = Event.new
    if @recruitment.save
     with_event = params[:with_event]
      if with_event == true
        event.title =  @recruitment.title
        event.user_id =  @recruitment.user_id
        event.area_id = @recruitment.area_id
        event.event_introduction = @recruitment.recruit_introduction =
        event.start = @recruitment.recruit_event_start
        event.end = @recruitment.recruit_event_end
        event.save
      end
      redirect_to recruitments_path
    else
      render 'new'
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
  end

  def recruitment_params
    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end)
  end
  def with_event_params
    params.permit(:with_event)
  end
end
