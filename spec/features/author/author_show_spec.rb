require 'rails_helper'

describe "Show author page", type: :feature do
  before {@my_author = FactoryBot.create :author}
  it "should load 'Alan Turing' without error" do
    visit author_path(@my_author.id)
    expect(page).to have_text('Alan Turing')
  end
end
