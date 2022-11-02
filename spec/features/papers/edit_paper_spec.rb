

describe "Edit paper page", type: :feature do
  it "should allow the selection of authors and save them" do
    paper = Paper.new(title:"something",venue: "hsdfd",year: 2000)
    paper.save()
    author = Author.new(first_name:"lfdg",last_name:"efgrads",homepage:"fdgasdff")
    author.save()
    author.reload()
    visit edit_paper_path(1)
    select author.name,from: "paper[author_ids][]"
    find('input[type="submit"]').click
    expect(Paper.select {|a| a.title == paper.title }).to_not be_empty
    expect((Paper.select {|a| a.title == paper.title })[0].authors).to include(author)
  end
end