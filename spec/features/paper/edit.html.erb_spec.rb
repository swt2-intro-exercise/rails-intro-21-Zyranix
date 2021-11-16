require 'rails_helper'

RSpec.describe "papers/edit", type: :feature do
  before {
    @my_paper = FactoryBot.create :paper
    @my_author = FactoryBot.create :author
    @my_paper.authors.push(@my_author)
    visit edit_paper_path(@my_paper.id)
  }
  it "should exist at 'edit_author_path' and render without error" do
  end
  it "should feature the option to link multiple authors" do
    expect(page).to have_css('select[multiple]')
    expect(page).to have_text('Authors')
  end
end
