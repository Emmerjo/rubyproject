require "application_system_test_case"

class BoardgamesTest < ApplicationSystemTestCase
  setup do
    @boardgame = boardgames(:one)
  end

  test "visiting the index" do
    visit boardgames_url
    assert_selector "h1", text: "Boardgames"
  end

  test "should create boardgame" do
    visit boardgames_url
    click_on "New boardgame"

    fill_in "Author", with: @boardgame.author
    fill_in "Price", with: @boardgame.price
    fill_in "Rating", with: @boardgame.rating
    fill_in "Title", with: @boardgame.title
    click_on "Create Boardgame"

    assert_text "Boardgame was successfully created"
    click_on "Back"
  end

  test "should update Boardgame" do
    visit boardgame_url(@boardgame)
    click_on "Edit this boardgame", match: :first

    fill_in "Author", with: @boardgame.author
    fill_in "Price", with: @boardgame.price
    fill_in "Rating", with: @boardgame.rating
    fill_in "Title", with: @boardgame.title
    click_on "Update Boardgame"

    assert_text "Boardgame was successfully updated"
    click_on "Back"
  end

  test "should destroy Boardgame" do
    visit boardgame_url(@boardgame)
    click_on "Destroy this boardgame", match: :first

    assert_text "Boardgame was successfully destroyed"
  end
end
