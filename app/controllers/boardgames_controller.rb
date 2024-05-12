class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /boardgames or /boardgames.json
  def index
    @boardgames = Boardgame.all
  end

  # GET /boardgames/1 or /boardgames/1.json
  def show
  end

  # GET /boardgames/new
  def new
    #@boardgame = Boardgame.new
    @boardgame = current_user.boardgames.build
  end

  # GET /boardgames/1/edit
  def edit
  end

  # POST /boardgames or /boardgames.json
  def create
    #@boardgame = Boardgame.new(boardgame_params)
    @boardgame = current_user.boardgames.build(boardgame_params)

    respond_to do |format|
      if @boardgame.save
        format.html { redirect_to boardgame_url(@boardgame), notice: "Boardgame was successfully created." }
        format.json { render :show, status: :created, location: @boardgame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boardgames/1 or /boardgames/1.json
  def update
    respond_to do |format|
      if @boardgame.update(boardgame_params)
        format.html { redirect_to boardgame_url(@boardgame), notice: "Boardgame was successfully updated." }
        format.json { render :show, status: :ok, location: @boardgame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boardgames/1 or /boardgames/1.json
  def destroy
    @boardgame.destroy

    respond_to do |format|
      format.html { redirect_to boardgames_url, notice: "Boardgame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @boardgame = current_user.boardgames.find_by(id: params[:id])
    redirect_to boardgames_path, notice: "Not authorized to edit this boardgame" if @boardgame.nil?    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boardgame_params
      params.require(:boardgame).permit(:title, :author, :price, :rating, :user_id)
    end
end
