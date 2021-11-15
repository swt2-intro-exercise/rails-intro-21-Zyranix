require 'rails_helper'

describe "Show all authors page", type: :feature do
  before {
        @my_author = FactoryBot.create :author
        visit authors_path
    }
  it "should load a table with columns 'First name', 'Last name', 'Homepage'" do
    expect(page).to have_css('table', text: 'First Name')
    expect(page).to have_css('table', text: 'Last Name')
    expect(page).to have_css('table', text: 'Homepage')
  end
  it "should load a table with every author" do
    within 'table' do
        expect(page).to have_text(@my_author.first_name)
        expect(page).to have_text(@my_author.last_name)
        expect(page).to have_text(@my_author.homepage)
    end
  end
  it "should have clickable links to the homepage and index page of every author" do
    within 'table' do
        expect(page).to have_link(@my_author.homepage, href: @my_author.homepage)
        expect(page).to have_link("Show", href: author_path(@my_author))
    end
  end
  it "should have a link to add new authors" do
    expect(page).to have_link 'Add author', href: new_author_path
  end
  it "should have a link to add new authors" do
    expect(page).to have_link 'Add author', href: new_author_path
  end
  it "should have a link to edit an author" do
    within 'table' do
      expect(page).to have_link 'Edit', href: edit_author_path(@my_author)
    end
  end
  it "should have a link to delete an author" do
    within 'table' do
      expect(page).to have_selector(:css, "a[data-method=delete][href='#{author_path(@my_author)}']")
    end
  end
end
