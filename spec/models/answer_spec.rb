require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "有効なファクトリを持つこと" do
    user = build(:user)
    question_master = build(:question_master)
    answer = build(:answer, 
      user: user,
      question_master: question_master,
      type: question_master.question_type
    )
    expect(answer).to be_valid
  end

  describe "全て入力があった場合" do
    before do
      @user = build(:user)
      @question_master = build(:question_master)
      @answer = build(:answer, 
        user: @user,
        question_master: @question_master,
        type: @question_master.question_type
      )
    end
    it "要件を全て入力していれば有効な状態であること" do
      expect(@answer).to be_valid
    end
    it "answerサイズが255以内であること" do
      expect(@answer.answer.size).to be <= 255
    end
  end
  
  describe "入力がないものがあった場合" do
    it "answerがなければ無効な状態であること" do
      user = build(:user)
      question_master = build(:question_master)
      answer = build(:answer, 
        user: user,
        question_master: question_master,
        type: question_master.question_type,
        answer: nil
      )
      answer.valid?
      expect(answer.errors[:answer]).to include("を入力してください")
    end
  end
end
