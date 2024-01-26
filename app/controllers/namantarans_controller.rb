class NamantaransController < ApplicationController
  before_action :set_namantaran, only: %i[ show edit update destroy ]

  # GET /namantarans or /namantarans.json
  def index
    @namantarans = Namantaran.all
  end

  # GET /namantarans/1 or /namantarans/1.json
  def show
  end

  # GET /namantarans/new
  def new
    @namantaran = Namantaran.new
  end

  # GET /namantarans/1/edit
  def edit
  end

  # POST /namantarans or /namantarans.json
  def create
    @namantaran = Namantaran.new(namantaran_params)

    respond_to do |format|
      if @namantaran.save
        format.html { redirect_to edit_namantaran_url(@namantaran), notice: "namantaran was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /namantarans/1 or /namantarans/1.json
  def update
    respond_to do |format|
      if @namantaran.update(namantaran_params)
        format.html { redirect_to namantaran_url(@namantaran), notice: "namantaran was successfully updated." }
        format.json { render :show, status: :ok, location: @namantaran }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @namantaran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /namantarans/1 or /namantarans/1.json
  def destroy
    @namantaran.destroy

    respond_to do |format|
      format.html { redirect_to namantarans_url, notice: "namantaran was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_namantaran
      @namantaran = Namantaran.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def namantaran_params
      params.require(:namantaran).permit(:flat_no, :pin_no, :aawak_no, :aawak_dinank, :sthan_par, :ka_naam, :nama_dinank, :pavati_no, :nama_rashi, :rujwat_dinank, :rujwat_rashi, :tal, :prathm, :divitiya, :tritiya, :other, :mohalla)
    end
end
