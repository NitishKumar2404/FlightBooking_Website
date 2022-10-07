class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authorized
  helper_method :logged_in?
  helper_method :is_admin?
  helper_method :current_reservation

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # def current_flight
  #   @current_flight ||=
  # end

  def current_reservation
    @current_reservation ||= Reservation.find(user_id: current_user.id, flight_id: @flight.id)
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end

  def is_admin?
    puts "CUR USER: "
    puts @current_user.email
    if @current_user.nil?
      puts "1"
      false
    elsif @current_user.email=="admin@ncsu.edu"
      puts "2"
      true
    else
      puts "3"
      false
    end
    end

end
