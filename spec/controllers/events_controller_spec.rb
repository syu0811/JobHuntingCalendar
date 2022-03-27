require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "ログインしている場合" do
    let!(:login_user) { create(:user) }
    let(:company) { create(:company, user: login_user) }
    let(:event) { create(:event, company: company, user: login_user) }

    before do
      sign_in login_user
      company
      event
    end

    describe "/events/" do
      it "ステータス OK が返ってくる" do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it "eventが取得できているか" do
        get :index
        expect(response.body).to include(event.title)
      end
    end

    describe "/events/new" do
      it "ステータス OK が返ってくる" do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "ログインしていない場合" do
    let(:user) { create(:user) }

    describe "/events" do
      it "ログイン画面へリダイレクトする" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "/events/new" do
      it "ログイン画面へリダイレクトする" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
