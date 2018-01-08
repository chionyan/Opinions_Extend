class AnswersController < ApplicationController
  
  def new
    @question_master = QuestionMaster.find(params[:id])
    if @question_master == "TextAnswer"
      redirect_to textnew_a_path(params[:id])
    end
  end
  
  def textnew
    @question_master = QuestionMaster.find(params[:id])
  end
  
  def radionew
    @question_master = QuestionMaster.find(params[:id])
    @options = @question_master.options
  end
  
  def checknew
    @question_master = QuestionMaster.find(params[:id])
    @options = @question_master.options
  end

  def create
    @question_master = QuestionMaster.find(params[:answer][:question_master_id])
    if (params[:answer][:type] == "Text")
      @answer = @question_master.textanswers.build(answer_params)
    elsif (params[:answer][:type] == "Radio")
      @answer = @question_master.radioanswers.build(answer_params)
    elsif (params[:answer][:type] == "Check")
      @answer = @question_master.checkanswers.build(checkanswer_params)
    end
    if @answer.save
      flash[:success] = '正常に回答されました'
      redirect_to @question_master
    else
      flash.now[:danger] = '正常に回答されませんでした'
      render :new
    end
  end

  def destroy
  end
  
  private

  # Strong Parameter
  def answer_params
    params.require(:answer).permit(:question_master_id,:answer,:user_id)
  end
  
  def checkanswer_params
    params.require(:answer).permit(:question_master_id,{:answer => []},:user_id)
  end
  
end
