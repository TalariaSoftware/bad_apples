require 'rails_helper'

RSpec.describe OfficerPolicy do
  subject { OfficerPolicy.new user, record }

  let(:resolved_scope) do
    OfficerPolicy::Scope.new(user, Officer.all).resolve
  end
  let(:record) { build :officer }

  context "when not logged in" do
    let(:user) { nil }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }

    describe 'scope' do
      let!(:record) { Officer.create }

      it "includes the record from resolved scope" do
        expect(resolved_scope).to include(record)
      end
    end
  end

  context "when logged in" do
    let(:user) { build :user }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }

    describe 'scope' do
      let!(:record) { Officer.create }

      it "includes the record from resolved scope" do
        expect(resolved_scope).to include(record)
      end
    end
  end
end
