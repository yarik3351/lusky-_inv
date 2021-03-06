class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  # before_action :check_authentication
  # before_action :check_admin
  #
  # def check_authentication
  #   redirect_to login_path unless logged_in?
  # end
  # def check_admin
  #   redirect_to root_path, :flash => { :danger => 'You dont belong there!' } unless admin?
  # end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html {redirect_to users_path}
      format.json {@user = User.find(params[:id])
      redirect_to users_path}
    end
  end

  # GET /users/login
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.invoices.exists?
      respond_to do |format|
        format.html { redirect_to users_url
        flash[:danger] = 'You can delete only users without invoices.' }
        format.json {}
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json {render nothing: true }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :name,
                                   :name_uk, :address, :address_uk,
                                   :phone, :bank_credentials, :admin)
    end
end
