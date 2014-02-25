class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
  end

  def new
    @proposal = Proposal.new
  end

  def edit
    set_proposal
  end

  def create
    @proposal = Proposal.new(proposal_params)

    @proposal.save

    respond_with @proposal, :location => proposals_path
  end

  def update
    @proposal = Proposal.find(params[:id])

    @proposal.update(proposal_params)
    respond_with @proposal, :location => proposals_path
  end

  def destroy
  end

  private
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    def proposal_params
      params.require(:proposal).permit(:user_id, :name, :description, :type_proposal)
    end

end
