# frozen_string_literal: true

require "rails_helper"

module Memberships
  RSpec.describe Membership do
    describe "associations" do
      it { is_expected.to belong_to :member }
      it { is_expected.to belong_to :membership_category }
      it { is_expected.to belong_to :cooperative }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :application_date }

      describe "unique member_id scoped to cooperative_id" do
        let!(:member)      { create(:person) }
        let!(:cooperative) { create(:cooperative) }
        let!(:old_record)  { create(:membership, member: member, cooperative: cooperative) }
        let!(:record)      { build(:membership, member: member, cooperative: cooperative) }

        it do
          record.save

          expect(record.errors[:cooperative_id]).to include("has already been taken")
        end
      end

      describe "unique member_id scoped to membership_category_id" do
        let!(:member)              { create(:person) }
        let!(:membership_category) { create(:membership_category) }
        let!(:old_record)          { create(:membership, member: member, membership_category: membership_category) }
        let!(:record)              { build(:membership, member: member, membership_category: membership_category) }

        it do
          record.save

          expect(record.errors[:membership_category_id]).to include("has already been taken")
        end
      end
    end
  end
end
