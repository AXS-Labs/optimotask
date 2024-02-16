require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:organizations).class_name('Organization') }
    it { should have_many(:boards).class_name('Board') }
  end
end
