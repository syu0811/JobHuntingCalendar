require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "ログインしている場合" do
    let!(:company) { create(:company) }
    let(:login_user) { create(:user) }

    before do
      sign_in login_user
    end

    describe "/companies" do
      it "ステータス OK が返ってくる" do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it "companyが取得できているか" do
        get :index
        expect(response.body).to include(company.name)
      end
    end

    describe "/companies/new" do
      it "ステータス OK が返ってくる" do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "ログインしていない場合" do
    let(:company) { create(:company) }

    describe "/companies" do
      it "ログイン画面へリダイレクトする" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "/companies/new" do
      it "ログイン画面へリダイレクトする" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
