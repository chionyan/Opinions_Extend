require 'rails_helper'

RSpec.describe QuestionMaster, type: :model do
  it "有効なファクトリを持つこと" do
    expect(build(:question_master)).to be_valid
  end

  describe "全て入力があった場合" do
    before do
      @question_master = build(:question_master)
    end
    it "要件を全て入力していれば有効な状態であること" do
      expect(@question_master).to be_valid
    end
    it "性別が選択肢から選択されていること" do
      expect(@question_master.question_type).to match(/^Radio$|^Check$|^Text$/)
    end
    it "タイトルサイズが255以内であること" do
      expect(@question_master.title.size).to be <= 255
    end
    it "内容サイズが255以内であること" do
      expect(@question_master.content.size).to be <= 255
    end
  end
  
  describe "入力がないものがあった場合" do
    it "question_typeがなければ無効な状態であること" do
      question_master = build(:question_master, question_type: nil)
      question_master.valid?
      expect(question_master.errors[:question_type]).to include("を入力してください")
    end
    
    it "titleがなければ無効な状態であること" do
      question_master = build(:question_master, title: nil)
      question_master.valid?
      expect(question_master.errors[:title]).to include("を入力してください")
    end
    
    it "contentがなければ無効な状態であること" do
      question_master = build(:question_master, content: nil)
      question_master.valid?
      expect(question_master.errors[:content]).to include("を入力してください")
    end
    
    it "deadlineがなければ無効な状態であること" do
      question_master = build(:question_master, deadline: nil)
      question_master.valid?
      expect(question_master.errors[:deadline]).to include("を入力してください")
    end
  end

end
