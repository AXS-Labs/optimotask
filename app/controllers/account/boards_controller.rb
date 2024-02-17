class Account::BoardsController < Account::BaseController
  def index
    authorize :board

    @boards = policy_scope(Board).order(:title)
  end

  def show
    @board = authorize(Board.find(params[:id]))
  end

  def new
    @board = authorize(Board.new)
  end

  def create
    @board = authorize(Board.new(create_params))
    @board.organization = current_user.organizations.last

    if @board.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.action(:redirect, account_board_path(@board)) }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:board).permit(:title)
  end
end
