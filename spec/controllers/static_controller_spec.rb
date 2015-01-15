require 'rails_helper'

RSpec.describe StaticController, :type => :controller do

  describe "GET top" do
    it "returns http success" do
      get :top
      expect(response).to have_http_status(:success)
    end
  end

end
