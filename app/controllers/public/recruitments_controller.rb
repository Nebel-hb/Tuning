class Public::RecruitmentsController < ApplicationController
  
  def index
     @recruitments = Recruitment.all
  end
  def new
     @recruitment = Recruitment.new
  end

  def show
     @recruitment = Recruitment.find(params[:id])
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
    if @recruitment.save
      redirect_to recruitments_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def confirm
  end

  def recruitment_params

    params.require(:recruitment).permit(:title, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end)

  end
end
