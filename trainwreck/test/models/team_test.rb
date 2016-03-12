require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @user = users(:johnny)
    @team = @user.teams.build(team_name: "The testers", team_contact_name: "Master Tester", team_phone_nr: 12345678)
  end

  test "should be valid" do
    assert @team.valid?
  end

  test "name should be present" do
    @team.team_name = "   "
    assert_not @team.valid?
  end

  test "name should not be too long" do
    @team.team_name = "x" * 51
    assert_not @team.valid?
  end

  test "name should be unique" do   #To be used if the team name should be constrained by uniqueness.
    duplicate_team = @team.dup
    duplicate_team.team_name = @team.team_name.upcase
    @team.save
    assert_not duplicate_team.valid?
  end

  test "order of names should be most recent first" do
    assert_equal teams(:most_recent), Team.first
  end

  test "contact name should be present" do
    @team.team_contact_name = "  "
    assert_not @team.valid?
  end

  test "contact name should not be too long" do
    @team.team_contact_name = "x" * 51
    assert_not @team.valid?
  end

  test "phone number validation should accept eight digit numbers" do
    valid_nrs = [10000000, 99999999]
    valid_nrs.each do |valid_nr|
      @team.team_phone_nr = valid_nr
      assert @team.valid?, "#{valid_nr.inspect} should be valid"
    end
  end

  test "phone number validation should reject numbers that are not eight digits long" do
    invalid_nrs = [9999999, 100000000]
    invalid_nrs.each do |invalid_nr|
      @team.team_phone_nr = invalid_nr
      assert_not @team.valid?, "#{invalid_nr.inspect} should be invalid"
    end
  end

  test "user id should be present" do
    @team.user_id = nil
    assert_not @team.valid?
  end

end
