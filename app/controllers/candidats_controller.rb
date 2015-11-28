class CandidatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidat, only: [:show, :edit, :update, :destroy]

  def index
    @current_candidat = current_user.candidat
  end

  def list_conversation
    @conversations = current_user.mailbox.conversations
  end

  def show_conversation
    @conversation = Mailboxer::Conversation.find(params[:id])
  end
  def reply_conversation
    @conversation = Mailboxer::Conversation.find(params[:conversation])
    current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to show_conversation_candidats_path(@conversation)
  end

  def my_ads

  end

  def show
  end

  # GET /candidats/new
  def new
    @candidat = Candidat.new
  end

  # GET /candidats/1/edit
  def edit
  end

  def create
    @candidat = Candidat.new(candidat_params)
    @candidat.user = current_user

    respond_to do |format|
      if @candidat.save
        format.html { redirect_to :root, notice: 'Candidat was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidat.update(candidat_params)
        format.html { redirect_to @candidat, notice: 'Candidat was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidat }
      else
        format.html { render :edit }
        format.json { render json: @candidat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidat.destroy
    respond_to do |format|
      format.html { redirect_to candidats_url, notice: 'Candidat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidat
      @candidat = Candidat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidat_params
      params.require(:candidat).permit(:name, :phone_number, :avatar, :my_cv)
    end
end
