require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを持つこと" do
    expect(build(:user)).to be_valid
  end

  describe "全て入力があった場合" do
    before do
      @user = build(:user)
    end
    it "要件を全て入力していれば有効な状態であること" do
      expect(@user).to be_valid
    end
    it "名前サイズが50以内であること" do
      expect(@user.name.size).to be <= 50
    end
    it "メールアドレスが規定のフォーマットに従って入力されていること" do
      expect(@user.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end
    it "性別が選択肢から選ばれていること" do
      expect(@user.sex).to match(/^男$|^女$|^その他$/)
    end
  end

  describe "入力がないものがあった場合" do
    it "名前がなければ無効な状態であること" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  
    it "メールアドレスがなければ無効な状態であること" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
    it "年齢がなければ無効な状態であること" do
      user = build(:user, age: nil)
      user.valid?
      expect(user.errors[:age]).to include("を入力してください")
    end
    
    it "性別がなければ無効な状態であること" do
      user = build(:user, sex: nil)
      user.valid?
      expect(user.errors[:sex]).to include("を入力してください")
    end
  end

  it "重複したメールアドレスなら無効な状態であること" do
    create(:user, email: 'aaron@example.com')
    user = build(:user, email: 'aaron@example.com')
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

end
