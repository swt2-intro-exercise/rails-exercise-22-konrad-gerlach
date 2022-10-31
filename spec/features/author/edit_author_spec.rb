require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    Author.new(first_name: "whatever",last_name:"Jancovic",homepage: "rocks your boat.com").save()
    visit edit_author_path(1)
  end
  it "should have text inputs for an author's first name, last name, and homepage" do
    Author.new(first_name: "whatever",last_name:"Jancovic",homepage: "rocks your boat.com").save()
    visit edit_author_path(1)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
  it "should save the author" do
    author = Author.new(first_name: "whatever",last_name:"Jancovic",homepage: "rocks your boat.com")
    author.save()
    visit edit_author_path(1)
    page.fill_in "author[first_name]", with: "Weid Al"
    page.fill_in "author[last_name]", with: "Jankovic123432"
    page.fill_in "author[homepage]", with: "weid.com"
    find('input[type="submit"]').click
    author.reload()
    expect(author.last_name).to eq("Jankovic123432")
  end
  it "should error when an invalid edit to an author is made" do
    author = Author.new(first_name: "whatever",last_name:"hi",homepage: "rocks your boat.com")
    author.save()
    expect(author).to be_valid
    visit edit_author_path(1)
    fill_in "author[first_name]", with: author.first_name
    fill_in "author[homepage]", with: author.homepage
    fill_in "author[last_name]", with: ""
    find('input[type="submit"]').click
    expect(page).to have_text('error')

  end
end