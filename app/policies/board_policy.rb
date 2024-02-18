# frozen_string_literal: true

class BoardPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    @user.boards.include?(@record)
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @user.boards.include?(@record)
  end

  def edit?
    update?
  end

  def destroy?
    @user.boards.include?(@record)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      @user.boards
    end

    private

    attr_reader :user, :scope
  end
end
