require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'associations' do
    it { should belong_to(:organization).class_name('Organization') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
