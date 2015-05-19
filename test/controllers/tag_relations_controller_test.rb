require 'test_helper'

class TagRelationsControllerTest < ActionController::TestCase
  setup do
    @tag_relation = tag_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_relation" do
    assert_difference('TagRelation.count') do
      post :create, tag_relation: { deck_id: @tag_relation.deck_id, pile_id: @tag_relation.pile_id, synergy_id: @tag_relation.synergy_id, tag_id: @tag_relation.tag_id }
    end

    assert_redirected_to tag_relation_path(assigns(:tag_relation))
  end

  test "should show tag_relation" do
    get :show, id: @tag_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_relation
    assert_response :success
  end

  test "should update tag_relation" do
    patch :update, id: @tag_relation, tag_relation: { deck_id: @tag_relation.deck_id, pile_id: @tag_relation.pile_id, synergy_id: @tag_relation.synergy_id, tag_id: @tag_relation.tag_id }
    assert_redirected_to tag_relation_path(assigns(:tag_relation))
  end

  test "should destroy tag_relation" do
    assert_difference('TagRelation.count', -1) do
      delete :destroy, id: @tag_relation
    end

    assert_redirected_to tag_relations_path
  end
end
