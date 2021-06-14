class Public::RecruitmentsController < ApplicationController

  def index
    @recruitment = Recruitment.new
    @search_past = params[:search_past]

    if  @search_past == "開催予定のイベント"
      @recruit = Recruitment.where("recruitments.recruit_end > ?", DateTime.now).reorder(:end)
    elsif @search_past == "過去のイベント"
      @recruit = Recruitment.where("recruitments.recruit_end < ?", DateTime.now).reorder(:end)
    else
      @recruit = Recruitment.all
    end

    @q =  @recruit.ransack(params[:q])
      @recruitments = @q.result(distinct: true)
      puts "============="
      p @recruitments
  end
  
  def new
    recruitment  = params[:recruitment]
   
    @recruit_instrument = RecruitInstrument.new
    @recruitment = Recruitment.find_by(id: recruitment)
    @recruit_instruments = RecruitInstrument.where(recruitment_id: recruitment)
    @event = Event.new

  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruit_users = RecruitUser.all
    @recruit_user = RecruitUser.where(recruitment_id: @recruitment.id )
    @count = RecruitUser.where(recruitment_id: @recruitment.id , join: 1).count
    @recruitment_user = RecruitUser.find_by(recruitment_id: @recruitment.id, user_id: current_user.id)

  end

  def edit
     @recruitment = Recruitment.find(params[:id])
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
     with_event = params[:with_event]
     p with_event
      if with_event == "true"
        event = Event.new
        event.title =  @recruitment.title
        event.user_id =  @recruitment.user_id
        event.area_id = @recruitment.area_id
        event.event_introduction = @recruitment.recruit_introduction
        event.start = @recruitment.recruit_event_start
        event.end = @recruitment.recruit_event_end
        event.save
      end
      redirect_to recruitment_path(@recruitment.id)
    else
      render 'edit'
    end
  end

  def create

     @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
       redirect_to new_recruitment_path(recruitment: @recruitment.id)
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
    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end, :instrument_id)
  end

  def recruit_instrument_params
    params.require(:recruit_instrument).permit(:instrument_id, :recruitment_id, :need_people)
  end

  def with_event_params
    params.permit(:with_event)
  end
end
