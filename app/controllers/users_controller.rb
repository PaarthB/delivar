class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show]

  def index
    redirect_to new_user_session_path if !user_signed_in?
    @user = current_user
    account
  end

  def show

  end

  def deliveries
    @user = current_user
    @orders = @user.deliveries
    account
  end


  def orders
    @user = current_user
    @orders = @user.orders
    account
  end

  def account
    @account = Account.where(user_id: current_user.id).first
    if @account == nil
      @account = Account.create(balance: 0, user_id: current_user.id)
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to :index, :alert => "Access denied."
      end
    end

end
