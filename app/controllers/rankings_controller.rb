class RankingsController < ApplicationController
  def answer
    @ranking_counts = Answer.ranking
    @question_masters_rank = QuestionMaster.find(@ranking_counts.keys)
  end
end
