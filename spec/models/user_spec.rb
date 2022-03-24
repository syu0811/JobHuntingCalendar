require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    context '正常系' do
      it "成功する" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context '異常系' do
      it "emailが無ければ失敗する" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it "passwordが6文字以上ないと失敗する" do
        user = build(:user, password: "a")
        user.valid?
        expect(user.errors[:password]).to include('は6文字以上で入力してください')
      end

      it "passwordがpassword_confirmationと同一でないと失敗する" do
        user = build(:user, password: "password", password_confirmation: "passworld")
        user.valid?
        expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
