describe "Index papers page", type: :feature do
  it "should only display a page if its year matches the given parameter" do
    paper1 = Paper.new(title:"something",venue: "hsdfd",year: 2000)
    paper2 = Paper.new(title:"else",venue: "hsdfdsd",year: 1970)
    paper1.save()
    paper2.save()
    visit papers_path+"?year=1970"
    expect(page).to_not have_text('something')
    expect(page).to have_text('else')
  end
end