require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
  end
  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
  it "should error when an invalid author is created" do
    author = Author.new(first_name: "whatever",homepage: "rocks your boat.com")
    expect(author).to_not be_valid
    visit new_author_path
    fill_in "First name", with: author.first_name
    fill_in "Homepage", with: author.homepage
    click_on "Save Author"
    expect(page).to have_text('error')

  end
 end
