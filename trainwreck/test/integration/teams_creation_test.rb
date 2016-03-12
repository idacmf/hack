require 'test_helper'

class TeamsCreationTest < ActionDispatch::IntegrationTest

  include Devise::TestHelpers

  def setup
    @user = users(:johnny)
    #@request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "invalid team creation information" do
    sign_in @user
    get addteam_path
    assert_no_difference 'Team.count' do
      post teams_path, team: {  team_name: "",
                                team_contact_name: "",
                                team_phone_nr: 123,
                                user_id: 0 }
    end
    assert_template 'teams/add'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid team creation information" do
    sign_in @user
    get addteam_path
    assert_difference 'Team.count', 1 do
      post_via_redirect teams_path, team: { team_name: "Train Wreck",
                                            team_contact_name: "Johnny Boy",
                                            team_phone_nr: 12345678,
                                            user_id: @user.user_id }
    end
    assert_template 'teams/show'
    assert_not flash.empty?
  end

end
