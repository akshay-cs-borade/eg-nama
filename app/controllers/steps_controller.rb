class StepsController < ApplicationController
  include Wicked::Wizard
  before_action :namantaran
  steps :page1, :page2, :page3, :page4 

  def show
    respond_to do |format|
      format.html { render_wizard }
      format.pdf do
        render pdf: "#{step}",
               template: "steps/#{step}",
               layout: 'pdf',
               page_size: 'A4'
      end
    end
  end

  def update
    namantaran.update(namantaran_params)
    render_wizard @namantaran
  end
  
  def finish_wizard_path
    root_path
  end

  private

  def namantaran
    @namantaran ||= Namantaran.find_by(id: params[:namantaran_id])
  end

  def namantaran_params
    params.require(:namantaran).permit(:flat_no, :pin_no, :aawak_no, :aawak_dinank, :sthan_par, :ka_naam, :nama_dinank, :pavati_no, :nama_rashi, :rujwat_dinank, :rujwat_rashi, :tal, :prathm, :divitiya, :tritiya, :other, :mohalla, :new_account, :jalkar_pin, :kachara_pin, :jahir_suchna_patr, :jahir_suchna_dinank, :rujwat_no)
  end
end
