class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    if current_user.id!=nil
      if current_user.email == "admin@ncsu.edu"
        @reservations =Reservation.search(params[:search_user_id])
      else
        @reservations = Reservation.where(user_id: current_user.id)
      end
    end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    if @flight.nil?
      @flight = Flight.find(params[:flight_id])
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
    if @flight.nil?
      @flight = Flight.find(@reservation.flight_id)
    end
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    # We create the transaction number using a random string of length 10
    @reservation.confirmation_num = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
    # puts params

    if @flight.nil?
      @flight = Flight.find(params[:reservation][:flight_id])
    end
    # @flight = Flight.find(params[:flight_id])

    # We link the transaction to the user and their credit card
    @reservation.user = current_user
    # We update the original product quantity
    # if @reservation.passengers_num>4
    #   @reservation.passengers_num=4
    # end
    if @reservation.passengers_num.nil?
      @reservation.passengers_num=1
    end
    if @flight.capacity < @reservation.passengers_num
      @reservation.passengers_num = @flight.capacity
    end
    @flight.capacity = @flight.capacity - @reservation.passengers_num
    @reservation.cost = @flight.cost * @reservation.passengers_num
    @reservation.save
    @flight.save
    if @flight.capacity ==0
      @flight.status = "Full"
      @flight.save
    end

    # self.reservation_prev_num = @reservation.passengers_num

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    if @flight.nil?
      @flight = Flight.find(params[:reservation][:flight_id])
    end
    # @reservation = Reservation.find(reservation_params[:id])
    @reservation = Reservation.find(params[:id])
    @reservation.user = current_user
    # raise("JJJJ")
    # prev_num = Reservation.find(@reservation.id).passengers_num
    puts "ggg"
    puts @reservation.passengers_num.class
    puts "FFF"
    puts params[:reservation][:passengers_num].class
    # @temp = params[:reservation][:passengers_num]
    # puts @temp
    # @difference = params[:reservation][:passengers_num] - @reservation.passengers_num

    @flight.capacity = @flight.capacity - params[:reservation][:passengers_num].to_i + @reservation.passengers_num
    @reservation.cost += @flight.cost * (params[:reservation][:passengers_num].to_i - @reservation.passengers_num)
    @reservation.save
    @flight.save
    # raise("AAAJ")
    if @flight.capacity ==0
      @flight.status = "Full"
      @flight.save
    else
      @flight.status = "Available"
      @flight.save
    end

    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy

    if @flight.nil?
      # @flight = Flight.find(params[:reservation][:flight_id])
      @flight = Flight.find(@reservation.flight_id)
    end

    @reservation.user = current_user
    if @flight.capacity ==0
      @flight.status = "Available"
    end

    @flight.capacity = @flight.capacity + @reservation.passengers_num
    @flight.save

    # temp = Bag.find(reservation_id: @reservation.id)
    # temp.destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:passengers_num, :category, :amenities, :cost, :flight_id, :user_id)
  end
end