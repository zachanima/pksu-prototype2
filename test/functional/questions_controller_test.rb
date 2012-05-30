require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
    @question = @topic.questions.create(name: 'Addresses in IPv4?')
    @answer = @question.answers.create({ name: '2<sup>32</sup>', is_correct: true })
  end

  test "should get index" do
    get :index, topic_id: @topic
    assert_response :success
    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:topics)
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new, topic_id: @topic
    assert_response :success
    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:question)
  end

  test "should get edit" do
    get :edit, topic_id: @topic, id: @question
    assert_response :success
    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:question)
  end

  test "should create question" do
    assert_difference('Question.count', 1) do
      post :create, question: { name: @question.name, topic_id: @topic.id }
    end

    assert_redirected_to topics_path
  end

  test "should not create question" do
    assert_no_difference('Question.count') do
      post :create, question: { name: '', topic_id: @topic.id }
    end

    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:question)
    assert_template :new
  end

  test "should update question with answer" do
    post :update, id: @question, question: {
      name: @question.name,
      answers_attributes: {
        one: {
          name: @answer.name,
          is_correct: @answer.is_correct
        }
      },
      topic_id: @topic.id
    }
    assert_redirected_to topics_path
  end

  test "should update question without answer" do
    post :update, id: @question, question: {
      name: @question.name,
      answers_attributes: {
      },
      topic_id: @topic.id
    }
    assert_redirected_to topics_path
  end

  test "should not update question" do
    post :update, id: @question, question: {
      name: '',
      answers_attributes: {
      },
      topic_id: @topic.id
    }
    assert_template :edit
    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to topics_path
  end
end
