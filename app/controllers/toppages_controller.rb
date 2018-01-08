class ToppagesController < ApplicationController
  def index
    @question_masters = QuestionMaster.all.order('created_at DESC')
  
    @ranking_counts = Answer.ranking
    @question_masters_rank = QuestionMaster.find(@ranking_counts.keys)
    @question_masters_limit = QuestionMaster.where('deadline >= ?', Time.now).limit(5)
  end
end
