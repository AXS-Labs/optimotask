class Account::BoardsController < Account::BaseController
  def index
    authorize :board

    @boards = policy_scope(Board).order(:title)
  end

  def show
    @board = authorize(Board.find(params[:id]))
  end
end
