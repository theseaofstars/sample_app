require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @activated = users(:michael)
    @no_activated = users(:noac)
  end

  test "show user profile when activated" do
    get user_path(@activated)
    assert_select 'h1',text:@activated.name
  end

  test "redirected to root_url when not activated" do
    get user_path(@no_activated)
    assert_redirected_to root_url
  end
end
