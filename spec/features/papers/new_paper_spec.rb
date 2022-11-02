describe "New paper page", type: :feature do
  it "should show all authors" do
    author = Author.new(first_name:"lfdg",last_name:"efgrads",homepage:"fdgasdff")
    author.save()
    visit new_paper_path
    expect(page).to have_text author.name
  end

  it "should allow the selection of authors and save them" do
    author = Author.new(first_name:"lfdg",last_name:"efgrads",homepage:"fdgasdff")
    author.save()
    author.reload()
    visit new_paper_path
    paper = Paper.new(title:"something",venue: "hsdfd",year: 2000)
    page.fill_in "paper[title]", with: paper.title
    page.fill_in "paper[venue]", with: paper.venue
    page.fill_in "paper[year]", with: paper.year
    select author.name,from: "paper[author_ids][]"
    find('input[type="submit"]').click
    expect(Paper.select {|a| a.title == paper.title }).to_not be_empty
    expect((Paper.select {|a| a.title == paper.title })[0].authors).to include(author)
  end

  it "should save the author" do
    visit new_author_path
    page.fill_in "author[first_name]", with: "Weid Al"
    page.fill_in "author[last_name]", with: "Jankovic"
    page.fill_in "author[homepage]", with: "weid.com"
    find('input[type="submit"]').click
    expect(Author.select {|a| a.name == "Weid Al Jankovic" }).to_not be_empty

  end
end
