require "rails_helper.rb"
   
describe "Integration tests for books and courses webpage" do

  before(:each) do
    @fd = Product.create(:name => "Ruby on Rails Tutorial 4.0",:short_description => "It is definitely one of the best Ruby on Rails books",:picture1 => "hartl.png",:affiliate_link => "--> READ MORE <--",:name_affiliate_link => "http://zfer.us/bp1hf")
  end
  
  it "checks if product is visible on the page" do
    visit "books_courses"
    expect(page).to(have_content(@fd.name))
    expect(page).to(have_content(@fd.short_description))
    expect(page).to(have_selector("img[src='/assets/#{@fd.picture1}']"))
    expect(page).to(have_selector("a[href='#{@fd.name_affiliate_link}']"))
    expect(page).to(have_content(@fd.affiliate_link))
  end
end