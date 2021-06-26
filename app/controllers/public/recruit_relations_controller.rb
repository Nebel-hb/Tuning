class Public::RecruitRelationsController < ApplicationController
  before_action :authenticate_user!
  def create
      @recruit_relation = RecruitRelation.new
      @recruit_relation.user_id = current_user.id
      puts 111111111111
      p @recruit_relation
    if @recruit_relation.save
       redirect_to new_recruitment_path(recruit_relation: @recruit_relation.id)
    end
  end
  
  private
  def recruit_relation_params
    params.require(:recruit_relation).permit(:user_id, :recruitment_id, :event_id)
  end

end
