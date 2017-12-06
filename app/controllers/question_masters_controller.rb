class QuestionMastersController < ApplicationController
  before_action :logged_in_user
  def new
    @question_master = QuestionMaster.new
  end  

  def create
    @question_master = QuestionMaster.new(question_master_params)
    # question_masterのtype種別が確認できる
    
    # if (@question_master.type == "yyy")
    #   render :radionew
    # elsif (@question_master.type == "xxx")
    #   render :checkboxnew
    # else
    #   render :textnew
    # end
  end

  def destroy
  end
  
  def show
      @question_master = QuestionMaster.find(params[:id])
      @answers_rand = @question_master.answers.order("RAND()").limit(5)
      @chart_data = @question_master.answers.group(:answer).count
      
      if @question_master.question_type == "Check"
        hash = Hash.new(0)
        @question_master.answers.pluck(:answer).each do |answer|
          JSON.parse(answer).inject(hash){|hash, a| hash[a] += 1; hash}
        end
        @chart_data = hash.select { |key,_| @question_master.options.pluck(:content).include? key }
      end
  end
  
  def textnew
    @question_master = QuestionMaster.new
    @option = Option.new
  end
  
  def textcreate
    @question_master = current_user.question_masters.build(question_master_params)
    if @question_master.save
      flash[:success] = '質問を投稿しました。'
      redirect_to root_url
    else
      @question_master = current_user.question_masters.order('created_at DESC')
      #.page(params[:page])
      flash.now[:danger] = '質問の投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def textdelete
  end
  
  def radionew
    @question_master = QuestionMaster.new
    4.times { @question_master.radio_options.build } #追加
  end
  
  def radiocreate
    @question_master = current_user.question_masters.new(radiocreate_params)
    
    if @question_master.save
      flash[:success] = '質問を投稿しました。'
      redirect_to root_url
    else
      #@question_master = current_user.question_masters.order('created_at DESC')
      #.page(params[:page])
      flash.now[:danger] = '質問の投稿に失敗しました。'
      render :radionew
    end
  end
  
  def checknew
    @question_master = QuestionMaster.new
    4.times { @question_master.check_options.build } #追加
  end
  
  def checkcreate
    @question_master = current_user.question_masters.new(checkcreate_params)
    
    if @question_master.save
      flash[:success] = '質問を投稿しました。'
      redirect_to root_url
    else
      #@question_master = current_user.question_masters.order('created_at DESC')
      #.page(params[:page])
      flash.now[:danger] = '質問の投稿に失敗しました。'
      render :radionew
    end
  end

  private

  def radiocreate_params
    params.require(:question_master).permit(:question_type, :user_id, :title, :content, :deadline,
                                            radio_options_attributes: [:content])
  end
  
  def checkcreate_params
    params.require(:question_master).permit(:question_type, :user_id, :title, :content, :deadline,
                                            check_options_attributes: [:content])
  end

  def question_master_params
    params.require(:question_master).permit(:question_type, :user_id, :title, :content, :deadline)
  end
  
  def option_params
  end
  
end
