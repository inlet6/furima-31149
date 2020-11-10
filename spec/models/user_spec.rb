require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
      end
      it "emailに@が含まれていれば登録できる" do
      end
      it "passwordが6文字以上なら登録できる" do
      end
      it "first_nameとfamily_nameが全角なら登録できる" do
      end
      it "first_name_kanaとfamily_name_kanaが全角カナなら登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nick_nameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが5文字以下だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameが全角でないと登録できない" do
      end
      it "family_nameが空だと登録できない" do
      end
      it "family_nameが全角でないと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが全角カナでないと登録できない" do
      end
      it "family_name_kanaが空だと登録できない" do
      end
      it "family_name_kanaが全角カナでないと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end
