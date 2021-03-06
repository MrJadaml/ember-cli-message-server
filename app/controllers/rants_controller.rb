class RantsController<ApplicationController
  skip_before_filter :authenticate_request
  skip_before_filter :verify_authenticity_token

  def index
    if params[:query]
      query = params[:query]
      rants = Rant.where("title like ? OR body like ?", "%#{ query }%", "%#{ query }%")
    else
      rants = Rant.all
    end
    render json: rants
  end

  def create
    rant = Rant.create(params.require(:rant).permit(:title, :body, :created_at, :user_id))
    render json: rant
  end

  def update
    rant = Rant.find(params[:id])
    rant.update(params.require(:rant).permit(:title, :body, :updated_at))
    render json: rant
  end

end
