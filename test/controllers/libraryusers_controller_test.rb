require 'test_helper'

class LibraryusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @libraryuser = libraryusers(:one)
  end

  test "should get index" do
    get libraryusers_url
    assert_response :success
  end

  test "should get new" do
    get new_libraryuser_url
    assert_response :success
  end

  test "should create libraryuser" do
    assert_difference('Libraryuser.count') do
      post libraryusers_url, params: { libraryuser: { email: @libraryuser.email, name: @libraryuser.name, password_digest: @libraryuser.password_digest } }
    end

    assert_redirected_to libraryuser_url(Libraryuser.last)
  end

  test "should show libraryuser" do
    get libraryuser_url(@libraryuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_libraryuser_url(@libraryuser)
    assert_response :success
  end

  test "should update libraryuser" do
    patch libraryuser_url(@libraryuser), params: { libraryuser: { email: @libraryuser.email, name: @libraryuser.name, password_digest: @libraryuser.password_digest } }
    assert_redirected_to libraryuser_url(@libraryuser)
  end

  test "should destroy libraryuser" do
    assert_difference('Libraryuser.count', -1) do
      delete libraryuser_url(@libraryuser)
    end

    assert_redirected_to libraryusers_url
  end
end
