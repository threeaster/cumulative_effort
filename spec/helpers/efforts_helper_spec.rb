require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EffortsHelper. For example:
#
# describe EffortsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EffortsHelper, :type => :helper do
  describe '#simple_num' do
    it 'n.0の形のfloatを投げるとintegerになって帰ってくる' do
      actual = simple_num(1.0).to_s
      expect(actual).to eq '1'
      expect(actual).not_to eq '1.0'
    end

    it 'n.0でない形のfloatを投げるとそのまま帰ってくる' do
      expect(simple_num 1.5).to eq 1.5
    end
  end
end
