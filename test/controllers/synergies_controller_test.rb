require 'test_helper'

class SynergiesControllerTest < ActionController::TestCase
  setup do
    @synergy = synergies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synergies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synergy" do
    assert_difference('Synergy.count') do
      post :create, synergy: { compliment_id: @synergy.compliment_id, pile_id: @synergy.pile_id }
    end

    assert_redirected_to synergy_path(assigns(:synergy))
  end

  test "should show synergy" do
    get :show, id: @synergy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @synergy
    assert_response :success
  end

  test "should update synergy" do
    patch :update, id: @synergy, synergy: { compliment_id: @synergy.compliment_id, pile_id: @synergy.pile_id }
    assert_redirected_to synergy_path(assigns(:synergy))
  end

  test "should destroy synergy" do
    assert_difference('Synergy.count', -1) do
      delete :destroy, id: @synergy
    end

    assert_redirected_to synergies_path
  end
end
