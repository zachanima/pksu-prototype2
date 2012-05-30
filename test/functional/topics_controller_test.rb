require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:topic)
  end

  test "should get edit" do
    get :edit, id: @topic
    assert_response :success
    assert_not_nil assigns(:topic)
  end

  test "should create topic" do
    assert_difference('Topic.count', 1) do
      post :create, topic: { name: @topic.name }
    end

    assert_redirected_to topics_path
  end

  test "should not create topic" do
    assert_no_difference('Topic.count') do
      post :create, topic: { name: '' }
    end

    assert_not_nil assigns(:topic)
    assert_template :new
  end

  test "should update topic" do
    post :update, id: @topic, topic: { name: @topic.name }
    assert_redirected_to topics_path
  end

  test "should not update topic" do
    post :update, id: @topic, topic: { name: '' }
    assert_template :edit
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, id: @topic
    end
    assert_redirected_to topics_path
  end
end
