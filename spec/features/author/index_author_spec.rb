require 'rails_helper'

describe "Author Index page", type: :feature do
  it "should contain an HTML table with the headings 'Name' and 'Homepage'" do
    visit authors_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_table("authors")
    expect(page).to have_xpath("//table/tr/th[text()='Name']")
    expect(page).to have_xpath("//table/tr/th[text()='Homepage']")
  end
  it "should list the full names as well as homepages of authors" do
    author = Author.new(first_name: "Weid Al2",last_name: "Jankovic2",homepage: "weird.com2")
    author.save
    visit authors_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_xpath("//table/tr/td[text()='#{author.name}']")
    expect(page).to have_xpath("//table/tr/td[text()='#{author.homepage}']")
  end
  it "should link to individual author's detail pages" do
    Author.new(last_name:"wertfd").save()
    visit authors_path
    expect(page).to have_link 'Show', href: author_path(1)
  end
  it "should link to the new author page" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end
  it "should link to individual author's edit pages" do
    Author.new(last_name:"wertfd").save()
    visit authors_path
    expect(page).to have_link 'Edit', href: edit_author_path(1)
  end
  it "should have a link to delete the author" do
    Author.new(last_name:"wertfd").save()
    visit authors_path
    expect(page).to have_link 'Delete'
  end
end