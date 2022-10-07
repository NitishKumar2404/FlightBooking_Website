class BagsController < ApplicationController
  before_action :set_bag, only: %i[ show edit update destroy ]

  # GET /bags or /bags.json
  def index
    # @bags = Bag.all
    if current_user.id!=nil
      if current_user.email == "admin@ncsu.edu"
        @bags = Bag.all
      else
        puts "FFF"
        puts params
        # @bags = Bag.where(user_id: current_user.id, reservation_id: params[:reservation_id] )
        # @bags = Bag.where(user_id: current_user.id, reservation_id: current_reservation.id )
        @bags = Bag.where(user_id: current_user.id)
      end
    end
  end


  # GET /bags/1 or /bags/1.json
  def show
  end

  # GET /bags/new
  def new
    @bag = Bag.new
    # if @reservation.nil?
    #   puts "OOO"
    #   puts params
    #   puts "OOO"
    #   @reservation = Reservation.find(params[:reservation_id])
    # end
  end

  # GET /bags/1/edit
  def edit
  end

  # POST /bags or /bags.json
  def create

    @bag = Bag.new(bag_params)
    @bag.user_id = current_user.id

    @reservation = Reservation.find(params[:bag][:reservation_id])
    # @reservation = Reservation.find(@bag.reservation_id)
    # puts "LLL"
    # puts @reservation.cost
    # puts "JJJ"
    # puts params[:bag][:cost]
    @reservation.cost+= params[:bag][:cost].to_f
    # puts "KKK"
    # puts @reservation.bags_num
    # puts "OOO"
    if @reservation.bags_num.nil?
      @reservation.bags_num = 1
    else
      @reservation.bags_num +=1
    end

    @reservation.save

    respond_to do |format|
      if @bag.save
        format.html { redirect_to bag_url(@bag), notice: "Bag was successfully created." }
        format.json { render :show, status: :created, location: @bag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bags/1 or /bags/1.json
  def update
    # @reservation = Reservation.find(params[:bag][:reservation_id])
    @bag.user_id = current_user.id
    @reservation = Reservation.find(@bag.reservation_id)
    @reservation.cost -= @bag.cost
    # @reservation.delete_bag_cost(@bag.cost)
    @reservation.cost+= params[:bag][:cost].to_f
    # @reservation.bags_num-=1
    @reservation.save

    respond_to do |format|
      if @bag.update(bag_params)
        format.html { redirect_to bag_url(@bag), notice: "Bag was successfully updated." }
        format.json { render :show, status: :ok, location: @bag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bags/1 or /bags/1.json
  def destroy
    @bag.user_id = current_user.id
    @reservation = Reservation.find(@bag.reservation_id)
    @reservation.cost-= @bag.cost
    @reservation.bags_num-=1
    @reservation.save

    @bag.destroy

    respond_to do |format|
      format.html { redirect_to bags_url, notice: "Bag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bag
    @bag = Bag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bag_params
    params.require(:bag).permit(:weight, :cost, :reservation_id, :user_id)
  end
end
