class LibraryusersController < ApplicationController
  before_action :set_libraryuser, only: [:show, :edit, :update, :destroy]
  before_action :authorize_Libraryuser
  skip_before_action :authorize_Libraryuser , only: [:new, :create]
  # GET /libraryusers
  # GET /libraryusers.json
  def index
    @libraryusers = Libraryuser.all
  end

  # GET /libraryusers/1
  # GET /libraryusers/1.json
  def show
  end

  # GET /libraryusers/new
  def new
    @libraryuser = Libraryuser.new
  end

  # GET /libraryusers/1/edit
  def edit
  end

  # POST /libraryusers
  # POST /libraryusers.json
  def create
    @libraryuser = Libraryuser.new(libraryuser_params)

    respond_to do |format|
      if @libraryuser.save
        format.html { redirect_to @libraryuser, notice: 'Libraryuser was successfully created.' }
        format.json { render :show, status: :created, location: @libraryuser }
      else
        format.html { render :new }
        format.json { render json: @libraryuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraryusers/1
  # PATCH/PUT /libraryusers/1.json
  def update
    respond_to do |format|
      if @libraryuser.update(libraryuser_params)
        format.html { redirect_to @libraryuser, notice: 'Libraryuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @libraryuser }
      else
        format.html { render :edit }
        format.json { render json: @libraryuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraryusers/1
  # DELETE /libraryusers/1.json
  def destroy
    @libraryuser.destroy
    respond_to do |format|
      format.html { redirect_to libraryusers_url, notice: 'Libraryuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_libraryuser
      @libraryuser = Libraryuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def libraryuser_params
      params.require(:libraryuser).permit(:name, :email, :password, :password_confirmation)
    end
end
