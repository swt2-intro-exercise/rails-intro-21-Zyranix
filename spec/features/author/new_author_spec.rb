require 'rails_helper'

describe "New author page", type: :feature do
  before {visit new_author_path}
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
  end
  it "should have text inputs for first & last name and a homepage of an author" do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
  it "should insert a new author in the database after submitting a filled form" do
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    page.find('input[type="submit"]').click
  end
  it "should display an error message if an invalid author entry is created" do
    page.fill_in 'author[first_name]', with: 'Foo'
    page.fill_in 'author[homepage]', with: 'http://foo.bar'
    page.find('input[type="submit"]').click
    expect(page).to have_text(/error/i)
    expect(page).to have_text(/Last name can\'t be blank/)
  end
end
