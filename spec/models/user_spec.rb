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
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick_name can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_message).to include("Email cant be blank")
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "1234m"
        @user.password_confirmation = "1234m"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに英数字が含まれていないと登録できない" do
        @user.password = "1234m"
        @user.password_confirmation = "1234m"
        @user.valid?
        @user.errors.full_messages
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "12345m"
        @user.password_confirmation = "123456m"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = "makk"
        @user.valid?
        @user.errors.full_messages
        
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name can't be blank")
      end
      it "family_nameが全角でないと登録できない" do
        @user.family_name = "makk"
        @user.valid?
        @user.errors.full_messages
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end
      it "first_name_kanaが全角カナでないと登録できない" do
        @user.first_name_kana = "m巻"
        @user.valid?
        @user.errors.full_messages
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
      end
      it "family_name_kanaが全角カナでないと登録できない" do
        @user.family_name_kana = "m巻"
        @user.valid?
        @user.errors.full_messages
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
