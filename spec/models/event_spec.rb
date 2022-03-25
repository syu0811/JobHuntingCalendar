require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validation' do
    let(:user) { create(:user) }

    context '正常系' do
      it "成功する" do
        event = build(:event, user: user)
        expect(event).to be_valid
      end
    end

    context '異常系' do
      it "titleが無ければ失敗する" do
        event = build(:event, title: nil)
        event.valid?
        expect(event.errors[:title]).to include('を入力してください')
      end

      it "user_idが無ければ失敗する" do
        event = build(:event, user: nil)
        event.valid?
        expect(event.errors[:user]).to include('を入力してください')
      end

      it "titleが30文字以内でないと失敗する" do
        event = build(:event, title: "a" * 31)
        event.valid?
        expect(event.errors[:title]).to include('は30文字以内で入力してください')
      end

      it "yearが無ければ失敗する" do
        event = build(:event, year: nil)
        event.valid?
        expect(event.errors[:year]).to include('を入力してください')
      end

      it "yearの値が指定の範囲外であれば失敗する" do
        event = build(:event, year: 0)
        event.valid?
        expect(event.errors[:year]).to include('は一覧にありません')
      end

      it "monthが無ければ失敗する" do
        event = build(:event, month: nil)
        event.valid?
        expect(event.errors[:month]).to include('を入力してください')
      end

      it "monthの値が指定の範囲外であれば失敗する" do
        event = build(:event, month: 0)
        event.valid?
        expect(event.errors[:month]).to include('は一覧にありません')
      end

      it "dayが無ければ失敗する" do
        event = build(:event, day: nil)
        event.valid?
        expect(event.errors[:day]).to include('を入力してください')
      end

      it "dayの値が指定の範囲外であれば失敗する" do
        event = build(:event, day: 0)
        event.valid?
        expect(event.errors[:day]).to include('は一覧にありません')
      end
    end
  end
end
