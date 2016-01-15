class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(answer_params[:post_id])
    @answer = @user.answers.new(answer_params)
    if @answer.save
      @answers = @post.answers.reverse
      respond_to do |format|
        format.html { redirect_to post_path(@post), notice: 'You answered this post' }
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  # def edit
  #   @post = Post.find(@answer.post_id)
  #   respond_to do |format|
  #     format.html { redirect_to post_path(@post) }
  #     format.js
  #   end
  # end

  # def update
  #   @user = User.find(params[:user_id])
  #   @post = Post.find(answer_params[:post_id])
  #   if @answer.update(answer_params)
  #     @answers = @post.answers.reverse
  #     respond_to do |format|
  #       format.html { redirect_to post_path(@post), notice: 'You edited this answer' }
  #       format.js
  #     end
  #   else
  #     respond_to do |format|
  #       format.js
  #     end
  #   end
  # end

  def destroy
    set_answer
    @post = Post.find(@answer.post_id)
    @answer.destroy
    @answers = @post.answers.reverse
    @answer = Answer.new
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'You remove your answer from this post' }
      format.js
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:content, :user_id, :post_id)
  end


  # def find_and_authorize_answer
  #   set_answer
  #   authorize @answer
  # end

  # def build_and_authorize_answer
  #   @answer = Answer.new
  #   authorize @answer
  # end
end