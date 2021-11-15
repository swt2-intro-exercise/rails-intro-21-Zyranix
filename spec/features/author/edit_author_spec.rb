require 'rails_helper'

describe "Edit author page", type: :feature do
  before {
        @my_author = FactoryBot.create :author
        visit edit_author_path(@my_author)
    }
  it "should exist at 'edit_author_path' and render withour error" do
  end
end
