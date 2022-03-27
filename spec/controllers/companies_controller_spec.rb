require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "ログインしている場合" do
    let!(:login_user) { create(:user) }
    let(:company) { create(:company, user: login_user) }

    before do
      sign_in login_user
      company
    end

    describe "/companies/:id" do
      it "ステータス OK が返ってくる" do
        get :show, params: { id: login_user.id }
        expect(response).to have_http_status(:ok)
      end

      it "companyが取得できているか" do
        get :show, params: { id: login_user.id }
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
    let(:user) { create(:user) }

    describe "/companies" do
      it "ログイン画面へリダイレクトする" do
        get :show, params: { id: user.id }
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
