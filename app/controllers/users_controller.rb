class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only:   [:edit, :update]
  before_action :update_last_seen


  def index
    # @search = User.search do 
    #   fulltext params[:search]
    # end
    @users = User.last(30)
  end

  def show
    @user = User.find(params[:id])
    @credibility = CredibilitySystem.find_by(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def udpdate
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.credibility_systems.create(points: "100")
      log_in @user
      flash[:success] = "Welcome to WordToken!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def create_via_oauth
    data = request.env['omniauth.auth']
    uid = data.uid
    @user = User.find_by oauth_id: uid
    if (@user) 
      log_in(@user)
    else 
      fake_email = (0...50).map { ('a'..'z').to_a[rand(26)] }.join + "@nulnulnulnul.com"
      fake_password  = (0...50).map { ('a'..'z').to_a[rand(26)] }.join + "@nulnulnulnul.com"
      name = data.info.name.split.first
      @user = User.new(oauth_id: uid, name: name, email: fake_email, password: fake_password)
      @user.save
      @user.credibility_systems.create(points: "100")
      log_in @user
      flash[:success] = "Welcome to WordToken!"
    end
      redirect_to @user
  end

  def destroy
    user = User.find(params[:id])
    unless current_user?(user) 
      user.destroy 
      flash[:success] = "User deleted."
    end
    redirect_to users_url
  end

  # def notable_givers
  #   @title = "Notable Givers"
  #   @user = User.find(params[:id])
  #   @users = @user
  # end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def signed_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
