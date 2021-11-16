require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should create a paper successfully" do
    # assign(:paper, Paper.new(
    #   title: "MyString",
    #   venue: "MyString",
    #   year: 1
    # ))
    my_title = 'Geometry'
    my_venue = 'Elsevier'
    my_year = 1980
    paper = Paper.new(title: my_title, venue: my_venue, year: my_year)
    expect(paper.title).to eq(my_title)
    expect(paper.venue).to eq(my_venue)
    expect(paper.year).to eq(my_year)
  end
  it "should fail on creating a paper without a title" do
    paper = Paper.new(venue: 'Foo', year: 1800)
    expect(paper).to_not be_valid
  end
  it "should fail on creating a paper without a venue" do
    paper = Paper.new(title: 'Foo', year: 1800)
    expect(paper).to_not be_valid
  end
  it "should fail on creating a paper without a publishing year" do
    paper = Paper.new(title: 'Bar', venue: 'Foo')
    expect(paper).to_not be_valid
  end
  it "should fail on creating a paper with non-integer year" do
    paper = Paper.new(title: 'Bar', venue: 'Foo', year: '56.6')
    expect(paper).to_not be_valid
    paper = Paper.new(title: 'Bar', venue: 'Foo', year: 'Döner')
    expect(paper).to_not be_valid
  end
  it "should be able to save authors it features" do
    paper = FactoryBot.create :paper
    expect(paper.authors).to eq([])
  end
  it "should be able to only show papers of a certain year" do
    paper1 = FactoryBot.create :paper
    paper2 = Paper.new(title: 'Bar', venue: 'Foo', year: '3000')
    filtered_paper_list = Paper.created_in(paper1.year)
    expect(filtered_paper_list.length).to eq(1)
    expect(filtered_paper_list[0].title).to eq(paper1.title)
  end
  
end
