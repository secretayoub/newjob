class CandidatsController < ApplicationController
  before_action :authenticate_user!

  # POST /candidats
  # POST /candidats.json
  def create
    @candidat_ad = CandidatAd.new(candidat_params)

    respond_to do |format|
      if @candidat_ad.save
        format.html { redirect_to :root, notice: 'Candidatidature was successfully created.' }
        format.json { render :show, status: :created, location: @candidat }
      else
        format.html { render :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def candidat_params
      params.require(:candidat_ad).permit(:ad_id, :candidat_id)
    end
end
