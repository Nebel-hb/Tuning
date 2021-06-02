class Public::RecruitmentsController < ApplicationController
  def index
     @recruitments = Recruitment.all
  
  end

  def show
     @recruitments = Recruitment.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  def confirm
  end
  
  def recruitment_params

    params.require(:recruitment).permit(:tite, :area_id, :user_id, :recruit_introduction, :recruit_start, :recruit_end)

  end
end
