require 'rails_helper'

describe "Author model", type: :model do
  it "should have first_name, last_name and homepage instance variables" do
    first_name = "Weid Al"
    last_name = "Jankovic"
    homepage = "weird.com"
    author = Author.new(first_name: first_name,last_name: last_name,homepage: homepage)
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end
  it "should furthermore have a method name (no parameters) which returns the full name of an author (the first name followed by the last name)" do
    first_name = "Weid Al"
    last_name = "Jankovic"
    homepage = "weird.com"
    author = Author.new(first_name: first_name,last_name: last_name,homepage: homepage)
    expect(author.name).to eq("Weid Al Jankovic")
  end
  it "should validate the existence of last_name" do
    author = Author.new(first_name: "whatever",homepage: "rocks your boat.com")
    expect(author).to_not be_valid
    author2 = Author.new(first_name: "whatever2",last_name: "",homepage: "rocks your boat.com")
    expect(author2).to_not be_valid
    author3 = Author.new(first_name: "whatever2",last_name: "wefgr",homepage: "rocks your boat.com")
    expect(author3).to be_valid
  end

end