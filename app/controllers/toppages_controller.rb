class ToppagesController < ApplicationController
  def index
    @question_masters = QuestionMaster.all.order('created_at DESC')
  end
end
