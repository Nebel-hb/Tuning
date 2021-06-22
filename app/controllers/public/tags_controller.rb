class Public::TagsController < ApplicationController

  def index
    @areas = Area.all
    @event = current_user.events.new
    @p = Tag.ransack(params[:p])
    @tag_search = @p.result(distinct: true)
    @q = Event.ransack(params[:q])
    @event_search = @q.result(distinct: true)
  end

   private
    def tag_params
      params.require(:tag).permit(:tag_name)
    end

end
