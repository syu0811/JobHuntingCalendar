require 'rails_helper'

RSpec.describe TopsController, type: :controller do
  describe "/tops" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
