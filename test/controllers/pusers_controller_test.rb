require 'test_helper'

class PusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puser = pusers(:one)
  end

  test "should get index" do
    get pusers_url
    assert_response :success
  end

  test "should get new" do
    get new_puser_url
    assert_response :success
  end

  test "should create puser" do
    assert_difference('Puser.count') do
      post pusers_url, params: { puser: {  } }
    end

    assert_redirected_to puser_url(Puser.last)
  end

  test "should show puser" do
    get puser_url(@puser)
    assert_response :success
  end

  test "should get edit" do
    get edit_puser_url(@puser)
    assert_response :success
  end

  test "should update puser" do
    patch puser_url(@puser), params: { puser: {  } }
    assert_redirected_to puser_url(@puser)
  end

  test "should destroy puser" do
    assert_difference('Puser.count', -1) do
      delete puser_url(@puser)
    end

    assert_redirected_to pusers_url
  end
end
