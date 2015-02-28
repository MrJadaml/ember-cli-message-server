class RantsController<ApplicationController

  def index
    render json: Rant.all
  end

end
