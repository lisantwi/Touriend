require 'test_helper'

class GuideServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guide_service_index_url
    assert_response :success
  end

  test "should get new" do
    get guide_service_new_url
    assert_response :success
  end

  test "should get create" do
    get guide_service_create_url
    assert_response :success
  end

  test "should get listing" do
    get guide_service_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get guide_service_pricing_url
    assert_response :success
  end

  test "should get description" do
    get guide_service_description_url
    assert_response :success
  end

  test "should get qualifications" do
    get guide_service_qualifications_url
    assert_response :success
  end

  test "should get photo_upload" do
    get guide_service_photo_upload_url
    assert_response :success
  end

  test "should get city" do
    get guide_service_city_url
    assert_response :success
  end

  test "should get update" do
    get guide_service_update_url
    assert_response :success
  end

end
