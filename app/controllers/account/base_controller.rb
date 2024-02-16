class Account::BaseController < ApplicationController
  include Pundit::Authorization

  layout 'account'

  before_action :authenticate_user!
end
