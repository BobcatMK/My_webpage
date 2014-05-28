require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get learn_webdeb" do
    get :learn_webdeb
    assert_response :success
  end

  test "should get motivation" do
    get :motivation
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get books_courses" do
    get :books_courses
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
