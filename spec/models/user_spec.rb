# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the User model
RSpec.describe User, type: :model do
  # Validation test
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
  end

  describe '#has_role?' do
    let(:super_user) { create(:user) }
    let(:basic_user) { create(:user, :basic) }

    it { expect(super_user.has_role?('super')).to eq true }
    it { expect(basic_user.has_role?('basic')).to eq true }
  end

  describe 'super user email' do
    let(:user) { create(:user) }

    it { expect(user.email).to eq('foo@bar.com') }
  end

  describe 'basic user email' do
    let(:user) { create(:user, :basic) }

    it { expect(user.email).to eq('random@bar.com') }
  end
end