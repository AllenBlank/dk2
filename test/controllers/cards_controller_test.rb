require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, card: { artist: @card.artist, card_type: @card.card_type, cmc: @card.cmc, color_id: @card.color_id, colors: @card.colors, expansion_id: @card.expansion_id, flavor: @card.flavor, formats: @card.formats, loyalty: @card.loyalty, mana_cost: @card.mana_cost, name: @card.name, newest: @card.newest, number: @card.number, original_text: @card.original_text, original_type: @card.original_type, power: @card.power, rarity: @card.rarity, reserved: @card.reserved, rulings: @card.rulings, text: @card.text, toughness: @card.toughness, types: @card.types }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card
    assert_response :success
  end

  test "should update card" do
    patch :update, id: @card, card: { artist: @card.artist, card_type: @card.card_type, cmc: @card.cmc, color_id: @card.color_id, colors: @card.colors, expansion_id: @card.expansion_id, flavor: @card.flavor, formats: @card.formats, loyalty: @card.loyalty, mana_cost: @card.mana_cost, name: @card.name, newest: @card.newest, number: @card.number, original_text: @card.original_text, original_type: @card.original_type, power: @card.power, rarity: @card.rarity, reserved: @card.reserved, rulings: @card.rulings, text: @card.text, toughness: @card.toughness, types: @card.types }
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: @card
    end

    assert_redirected_to cards_path
  end
end
