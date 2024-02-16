class Account::BoardsController < Account::BaseController
  def index
    authorize :board
  end
end
