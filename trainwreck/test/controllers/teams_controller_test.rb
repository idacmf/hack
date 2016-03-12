require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = users(:johnny)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @other_user = users(:noname)
    @team = teams(:tsi)
  end

  test "should get add" do
    sign_in @user
    get :add
    assert_response :success
    assert_select "title", "Add team | Team view of Tournament App"
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @team
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @team, user: { name: @user.first_name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect edit when logged in as wrong user" do
    sign_in(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    sign_in(@other_user)
    patch :update, id: @user, user: { name: @user.first_name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end


  test "should get viewteams" do
    get :viewteams
    assert_response :success
    assert_select "title", "Team view of Tournament App"
  end

  #There's currently no test for a view that provides an empty title (Should still display "Tournament App")

end
