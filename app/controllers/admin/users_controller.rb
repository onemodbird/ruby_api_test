class Admin::UsersController < Admin::AdminController

  before_action :authorize_superuser!, except: [:edit, :update]
  before_action :find_user, only: [:edit, :show, :update]
  before_action :authorize_user!, only: [:edit, :update]

  def index
    @users = User.order(:name).page(params[:page]).per(50)
    if params[:q].present?
      @users = @users.where(
        "name ILIKE :q OR email ILIKE :q", q: "%#{params[:q]}%"
      )
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(new_user_params)
    if @user.persisted?
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    learning_product_kinds = %w(learning_product activity unit)
    @learning_products = @user.resources.where(kind: learning_product_kinds)

    @assignments =
      @user.assignments.includes(:assignable).map{ |asgn| asgn.assignable }
  end

  def edit
  end

  def update
    @user.attributes = user_params

    if current_user.superuser?
      @user.visible = superuser_user_params[:visible]
      @user.superuser = superuser_user_params[:superuser]

      if @user.access_locked? && superuser_user_params[:access_locked] == '0'
        @user.locked_at = nil
        @user.failed_attempts = 0
      elsif !@user.access_locked? && superuser_user_params[:access_locked] == '1'
        @user.locked_at = Time.zone.now
      end

      if @user.active? && superuser_user_params[:active] == '0'
        @user.flags.delete('active')
      elsif !@user.active? && superuser_user_params[:active] == '1'
        @user.flags.store('active', true)
      end
    end

    if @user.save
      redirect_to (current_user.superuser? ? admin_users_path : admin_path)
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    unless current_user.superuser? || ( current_user == @user )
      flash[:alert] = "Sorry, you are not allowed to access that action"
      redirect_to admin_path
    end
  end

  def new_user_params
    params
      .require(:user)
      .permit(*new_user_fields)
  end

  def user_params
    params
      .require(:user)
      .permit(*user_fields)
  end

  def superuser_user_params
    params
      .require(:user)
      .permit(*superuser_user_fields)
  end

  def password_fields
    if params[:user][:password].present?
      [:password, :password_confirmation]
    else
      []
    end
  end

  def new_user_fields
    password_fields + [
      :name,
      :email
    ]
  end

  def user_fields
    new_user_fields + [
      :bio,
      :google_profile_id,
      :twitter_username,
      :external_profile_url_1,
      :external_profile_url_2,
      :picture
    ]
  end

  def superuser_user_fields
    user_fields + [
      :superuser,
      :visible,
      :access_locked,
      :active
    ]
  end

end
