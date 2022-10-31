require 'rails_helper'

describe "Paper model", type: :model do
  it "should have title, venue and year instance variables" do
    title = "Weid Al"
    venue = "Jankovic"
    year = 2002
    paper = Paper.new(title: title, year: year, venue:venue)
    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)
  end
  it "should have an empty list of authors" do
    paper = Paper.new(title: "some title",year: 2002, venue:"home")
    expect(paper.authors.size).to eq(0)
  end
  it "should validate the existence of title" do
    paper = Paper.new(title: "", year: 2002, venue:"home")
    expect(paper).to_not be_valid
    paper = Paper.new(year: 2002, venue:"home")
    expect(paper).to_not be_valid
    paper = Paper.new(title: "some title",year: 2002, venue:"home")
    expect(paper).to be_valid
  end
  it "should validate the existence of venue" do
    paper = Paper.new(title: "some title", year: 2002, venue:"")
    expect(paper).to_not be_valid
    paper = Paper.new(title: "some title",year: 2002)
    expect(paper).to_not be_valid
    paper = Paper.new(title: "some title",year: 2002, venue:"home")
    expect(paper).to be_valid
  end
  it "should validate the existence of year" do
    paper = Paper.new(title: "some title", venue:"home")
    expect(paper).to_not be_valid
    paper = Paper.new(title: "some title",year: 2002, venue:"home")
    expect(paper).to be_valid
  end
end