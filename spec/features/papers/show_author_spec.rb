require 'rails_helper'

describe "Show paper page", type: :feature do
  it "should show the paper's authors' names" do
    author = Author.new(first_name:"lfdg",last_name:"efgrads",homepage:"fdgasdff")
    author.save()
    paper = Paper.new(title:"dsadfs",venue:"agdsdf",year: 1200)
    paper.authors.append(author)
    paper.save()
    visit paper_path(1)
    expect(page).to have_text author.name
  end
end