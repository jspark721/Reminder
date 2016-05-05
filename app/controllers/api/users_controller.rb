class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    return permission_denied_error unless conditions_met

    users = User.all

    render json: users, each_serializer: UserSerializer
  end

  def show
    user = User.find(params[:id])

    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:email)
  end

  def conditions_met
    true
  end

end
