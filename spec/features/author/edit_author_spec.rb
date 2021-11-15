require 'rails_helper'

describe "Edit author page", type: :feature do
  before {
        @my_author = FactoryBot.create :author
        visit edit_author_path(@my_author)
    }
  it "should exist at 'edit_author_path' and render withour error" do
  end
  it "should edit an existing author in the database after submitting a filled form" do
    page.fill_in 'author[first_name]', with: 'Alann'
    page.fill_in 'author[last_name]', with: 'Turingg'
    page.fill_in 'author[homepage]', with: 'https://wikipedia.org/Alan_Turing'
    page.find('input[type="submit"]').click
    expect(page).to have_text('Alann')
    expect(page).to have_text('Turingg')
    expect(page).to have_text('https://wikipedia.org/Alan_Turing')
  end
  it "should display an error message if the edit is invalid" do
    page.fill_in 'author[first_name]', with: 'Foo'
    page.fill_in 'author[last_name]', with: ''
    page.fill_in 'author[homepage]', with: 'http://foo.bar'
    page.find('input[type="submit"]').click
    expect(page).to have_text(/error/i)
    expect(page).to have_text(/Last name can\'t be blank/)
  end
end
