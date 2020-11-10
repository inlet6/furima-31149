require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録できる" do
        @user.email = "makk@makk.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上、英数字混合なら登録できる" do
        @user.password = "makk00"
        @user.password_confirmation = "makk00"
        expect(@user).to be_valid
      end
      it "first_nameとfamily_nameが全角なら登録できる" do
        @user.first_name = "マック"
        @user.family_name = "巻"
        expect(@user).to be_valid
      end
      it "first_name_kanaとfamily_name_kanaが全角カナなら登録できる" do
        @user.first_name_kana = "マック"
        @user .family_name_kana = "マキ"
        expect(@user).to be_valid
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
