class Admin::OrchestrasController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orchestras = Orchestra.all
    application_user = Orchestra.pluck(:user_id)
    @sum = User.where(id: application_user, role: "general")
    
  end
  def edit
  end

  def update
  end


end
