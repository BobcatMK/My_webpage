require "rails_helper.rb"

describe "Checking about page for proper content" do
  let!(:all_projects) { Projectsabout.create(name: "Matthew Kilan Programmer and Entrepreneur",description: "some content",picture1: "aa.jpg",picture2: "asdf.jpg",picture3: "asdf.jpg",picture4: "asdf.jpg", link: "http://www.matthew-kilan.com") }
  let!(:mystory) { Mystory.create(name: "My story:",body: "My name is Matthew...") }
  
  it "testing about page" do
    visit "/about"
    expect(page).to(have_content(mystory.name))
    expect(page).to(have_content(mystory.body))
    expect(page).to(have_content(all_projects.name))
    click_link(all_projects.link)
    visit "/about"
    click_link("CLICK TO READ MORE")
    expect(page).to(have_content(all_projects.description))
  end
end

