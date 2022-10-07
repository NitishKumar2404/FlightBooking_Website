class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if current_user.email=="admin@ncsu.edu"
      @users = User.all
    else
        flash[:notice] = current_user.name+" IS A CHEATTTTTTT !!!. DONT ACCESS OTHER's CONTENT "
        redirect_to root_path
        return
      end


  end

  # GET /users/1 or /users/1.json
  def show
  #   if user_params[:user_id] != current_user.id
  #     flash[:notice] = "You don't have access to that order!"
  #     redirect_to root_path(session[:user_id])
  #   end
    if current_user.email !="admin@ncsu.edu"
      @user = User.find params[:id]
      if current_user.id != @user.id
        flash[:notice] = current_user.name+" IS A CHEATTTTTTT !!!. DONT ACCESS OTHER's CONTENT "
        redirect_to root_path
        return
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.email == "admin@ncsu.edu"
      respond_to do |format|
        format.html { redirect_to users_url, notice: "HAHAHA We are Smart." }
        format.json { head :no_content}
        end
    else

      @user.destroy
      respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end

    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :card, :address, :mobile, :email, :password, :password_confirmation)
    end
end
