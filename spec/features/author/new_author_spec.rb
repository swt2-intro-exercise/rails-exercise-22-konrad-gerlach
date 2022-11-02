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
  it "should save the author" do
    visit new_author_path
    page.fill_in "author[first_name]", with: "Weid Al"
    page.fill_in "author[last_name]", with: "Jankovic"
    page.fill_in "author[homepage]", with: "weid.com"
    find('input[type="submit"]').click
    expect(Author.select {|a| a.name == "Weid Al Jankovic" }).to_not be_empty

  end
  it "should error when an invalid author is created" do
    author = Author.new(first_name: "whatever",homepage: "rocks your boat.com")
    expect(author).to_not be_valid
    visit new_author_path
    fill_in "First name", with: author.first_name
    fill_in "Homepage", with: author.homepage
    find('input[type="submit"]').click
    expect(page).to have_text('error')

  end

 end
