require 'rails_helper'

describe "Author page", type: :model do
  it "should create an author named 'Alan Turing' and a corresponding homepage" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    my_first_name = 'Alan'
    my_last_name = 'Turing'
    my_homepage = 'http://wikipedia.org/Alan_Turing'
    author = Author.new(first_name: my_first_name, last_name: my_last_name, homepage: my_homepage)
    expect(author.first_name).to eq(my_first_name)
    expect(author.last_name).to eq(my_last_name)
    expect(author.homepage).to eq(my_homepage)
    expect(author.name).to eq("#{my_first_name} #{my_last_name}")
  end
end