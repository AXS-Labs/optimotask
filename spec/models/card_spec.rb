require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'associations' do
    it { should belong_to(:board).class_name('Board') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
