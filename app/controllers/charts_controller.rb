class ChartsController < ApplicationController
  def index
    #@question_master = QuestionMaster.find(params[:id])
    #@chart_data = QuestionMaster.find(params[:id]).answers.group(:answer).count
    @chart_data = Model.order('date ASC').group(:date).count
  end
end
