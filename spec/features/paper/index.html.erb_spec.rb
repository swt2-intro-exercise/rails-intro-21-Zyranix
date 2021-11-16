require "rails_helper"

describe "Show all papers page", type: :feature do
  before {
    @my_paper = FactoryBot.create :paper
    visit papers_path
  }
  it "should be able to filter by year" do
    # TODO
    @newer_paper = Paper.create(title: "Better paper", venue: "Here", year: 3000)
    visit papers_path(year: @my_paper.year)
    expect(page).to have_text(@my_paper.title)
    expect(page).to_not have_text(@newer_paper.title)
  end
end
