require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  let(:login_user) { create(:user) }

  before do
    sign_in login_user
  end

  describe "/shops/:id" do
    it "ステータス OK が返ってくる" do
      get :show, params: { id: login_user.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
