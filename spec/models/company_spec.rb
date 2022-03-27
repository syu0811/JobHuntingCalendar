require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Validation' do
    let(:user) { create(:user) }

    context '正常系' do
      it "成功する" do
        company = build(:company, user: user)
        expect(company).to be_valid
      end
    end

    context '異常系' do
      it "nameが無ければ失敗する" do
        company = build(:company, name: nil)
        company.valid?
        expect(company.errors[:name]).to include('を入力してください')
      end

      it "user_idが無ければ失敗する" do
        company = build(:company, user: nil)
        company.valid?
        expect(company.errors[:user]).to include('を入力してください')
      end

      it "nameが20文字以内でないと失敗する" do
        company = build(:company, name: "a" * 21)
        company.valid?
        expect(company.errors[:name]).to include('は20文字以内で入力してください')
      end
    end
  end
end
