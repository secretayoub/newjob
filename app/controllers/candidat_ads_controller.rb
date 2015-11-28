class CandidatAdsController < ApplicationController
  before_action :authenticate_user!

  # POST /candidats
  # POST /candidats.json
  def create
    @candidat_ad = CandidatAd.new(candidat_ad_params)
    @candidat_ad.candidat_id = current_user.candidat.id


    respond_to do |format|
      if @candidat_ad.save
        format.html { redirect_to :root, notice: 'Candidatiture was successfully created.' }
      else
        format.html { render :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def candidat_ad_params
      params.require(:candidat_ad).permit(:ad_id)
    end
end
