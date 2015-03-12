class RantsController<ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Rant.all
  end

  def create
    rant = Rant.create(params.require(:rant).permit(:title, :body))
    render json: rant
  end

  def update
    rant = Rant.find(params[:id])
    rant.update(params.require(:rant).permit(:title, :body))
    render json: rant
  end

end
