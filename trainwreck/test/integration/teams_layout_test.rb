require 'test_helper'

class TeamsLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'teams/viewteams'
    assert_select "a[href=?]", root_path, count: 0
    assert_select "a[href=?]", addteam_path, count: 1
  end
end
