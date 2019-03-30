require 'rails_helper'
require "cancan/matchers"

RSpec.describe 'User' do
  describe "abilities" do
    subject(:ability) { Ability.new(user) }
    let(:user)        { nil }

    context "when a super user" do
      let(:user) { create(:user) }

      it { should be_able_to(:manage, :all) }
    end

    context "basic" do
      let(:user) { create(:user, :basic) }

      it { should_not be_able_to(:manage, :all) }
    end
  end
end
