class QuestionsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @topics = Topic.scoped
    @questions = @topic.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.new
    @question.answers.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:id])
    @question.answers.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to topics_path, notice: 'Question was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    params[:question][:answers_attributes].each_pair do |key, value|
      if value['name'].blank?
        Answer.destroy value['id'] if value['id']
        params[:question][:answers_attributes].delete(key)
      end
    end
    @question = Question.find(params[:id])

    if @question.update_attributes(params[:question])
      redirect_to topics_path, notice: 'Question was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to topics_path
  end
end
