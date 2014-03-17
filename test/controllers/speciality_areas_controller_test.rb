require 'test_helper'

class SpecialityAreasControllerTest < ActionController::TestCase
  setup do
    @speciality_area = speciality_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:speciality_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create speciality_area" do
    assert_difference('SpecialityArea.count') do
      post :create, speciality_area: { name: @speciality_area.name }
    end

    assert_redirected_to speciality_area_path(assigns(:speciality_area))
  end

  test "should show speciality_area" do
    get :show, id: @speciality_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @speciality_area
    assert_response :success
  end

  test "should update speciality_area" do
    patch :update, id: @speciality_area, speciality_area: { name: @speciality_area.name }
    assert_redirected_to speciality_area_path(assigns(:speciality_area))
  end

  test "should destroy speciality_area" do
    assert_difference('SpecialityArea.count', -1) do
      delete :destroy, id: @speciality_area
    end

    assert_redirected_to speciality_areas_path
  end
end
