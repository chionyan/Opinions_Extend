require 'rails_helper'

RSpec.describe Option, type: :model do
  it "有効なファクトリを持つこと" do
    question_master = build(:question_master)
    option = build(:option, 
      question_master: question_master,
      type: question_master.question_type
    )
    expect(option).to be_valid
  end

  describe "全て入力があった場合" do
    before do
      @question_master = build(:question_master)
      @option = build(:option, 
        question_master: @question_master,
        type: @question_master.question_type
      )
    end
    it "要件を全て入力していれば有効な状態であること" do
      expect(@option).to be_valid
    end
    it "contentサイズが255以内であること" do
      expect(@option.content.size).to be <= 255
    end
  end
  
  describe "入力がないものがあった場合" do
    it "contentがなければ無効な状態であること" do
      question_master = build(:question_master)
      option = build(:option, 
        question_master: question_master,
        type: question_master.question_type,
        content: nil
      )
      option.valid?
      expect(option.errors[:content]).to include("を入力してください")
    end
  end
  
end
