class PollsController < ApplicationController

  autocomplete :proposal, :full => true, :extra_data => [:slogan]

  def index
    @polls = Poll.all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
  end

  def new
    @poll = Poll.new
  end

  def edit
  end

  def create
    @poll = Poll.new(poll_params)

    @poll.save

    respond_with @poll, :location => polls_path
  end

  def update
    @poll = Poll.find(params[:id])

    @poll.update(poll_params)
    respond_with @poll, :location => polls_path

  end

  def destroy
  end

  def like
    @poll = Poll.find(params[:id])
    @poll.like(current_user.id)
    flash[:notice] = 'Sua aprovação foi registrada'
     redirect_to polls_path
  end

  def unlike
    @poll = Poll.find(params[:id])
    @poll.unlike(current_user.id)
    flash[:notice] = 'Sua reprovação foi registrada'
     redirect_to polls_path
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:proposal_id, :status_poll)
    end

end
