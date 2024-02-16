require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { should have_many(:users).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
