class Public::RecruitmentsController < ApplicationController

  def index
    # @recruitments = Recruitment.where("recruitments.recruit_end > ?", DateTime.now).reorder(:recruit_end)
    # @q = Recruitment.ransack(params[:q])
    # @recruitments = @q.result(distinct: true)
    # @search_all = params[:search_all]
    @recruitments = Recruitment.search_recruit(params[:word])
    
    

    # if @search_all == "1"
    #   @search = Recruitment.search(word)
      puts "====================="
      p @recruitments
    # else
    # @q = Recruitment.ransack(params[:q])
    #   @recruitments = @q.result(distinct: true)

    # end
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
     a = (with_event_params)
     puts "aaaaaaaaaaaaaaaaaaaaaaaa"
     p a
     event = Event.new
    if @recruitment.save
      if a == true
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
    @recruit_users = User.where(id: RecruitUser.where(recruitment_id: @recruitment).pluck(:user_id))
    @recruit_user = RecruitUser.new
  end

  def recruitment_params
    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end,:recruit_event_start, :recruit_event_end)
  end
  def with_event_params
    params.permit(:with_event)
  end
end
