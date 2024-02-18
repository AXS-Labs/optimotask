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
      @boards = policy_scope(Board).order(:title)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @board = authorize(Board.find(params[:id]))
  end

  def update
    @board = authorize(Board.find(params[:id]))

    unless @board.update(update_params)
      render :new, status: :unprocessable_entity
    end
  end

  def confirm_destroy
    @board = authorize(Board.find(params[:board_id]), :destroy?)
  end

  def destroy
    @board = authorize(Board.find(params[:id]))
    @board.destroy
  end

  private

  def create_params
    params.require(:board).permit(:title)
  end

  def update_params
    params.require(:board).permit(:title)
  end
end
