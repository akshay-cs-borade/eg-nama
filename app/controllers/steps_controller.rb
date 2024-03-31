class StepsController < ApplicationController
  include Wicked::Wizard
  before_action :namantaran
  steps :page1, :page2, :page3, :page4 

  def show
    render_wizard
  end

  def update
    namantaran.update(flat_no: 102)
    render_wizard @namantaran
  end
  
  def finish_wizard_path
    root_path
  end

  private

  def namantaran
    @namantaran ||= Namantaran.find_by(params[:namantaran_id])
  end
end
