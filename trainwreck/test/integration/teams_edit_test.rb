require 'test_helper'

class TeamsEditTest < ActionDispatch::IntegrationTest

  include Devise::TestHelpers

  def setup
    @team = teams(:tsi)
    @user = users(:johnny)
    #@request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "unsuccessful edit" do
    sign_in(@user)
    get edit_team_path(@team)
    assert_template 'teams/edit'
    patch team_path(@team), team: { team_name:  "",
                                    team_contact_name: "foo@invalid",
                                    team_phone_nr:  123,
                                    user_id: 0 }
    assert_template 'teams/edit'
  end

  test "successful edit" do
    sign_in(@user)
    get edit_team_path(@team)
    assert_template 'teams/edit'
    name = "The Champions"
    contact = "John Doe"
    phone = 11111111
    id = @user.user_id
    patch team_path(@team), team: { team_name: name,
                                    team_contact_name: contact,
                                    team_phone_nr: phone,
                                    user_id: id }
    assert_not flash.empty?
    assert_redirected_to @team
    @team.reload
    assert_equal name, @team.team_name
    assert_equal contact, @team.team_contact_name
    assert_equal phone, @team.team_phone_nr
    assert_equal id, @team.user_id
  end

end
