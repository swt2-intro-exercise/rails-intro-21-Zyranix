require "rails_helper"

describe "papers/show", type: :feature do
  before {
    @my_paper = FactoryBot.create :paper
    @my_author = FactoryBot.create :author
    @my_paper.authors.push(@my_author)
    visit paper_path(@my_paper.id)
  }

  it "should load a paper without error" do
    expect(page).to have_text(@my_paper.title)
  end

  it "shows the authors it features" do
    expect(page).to have_text(@my_author.name)
  end
end
