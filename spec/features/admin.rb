require "rails_helper.rb"

  #def admin
  #  @all_posts_webdevelopment = Post.all
  #  @all_posts_motivation = PostMotivation.all
  #  @projects_all = Projectsabout.all
  #  @mystory = Mystory.find(1)
  #  @contact_info = Contactinfo.find(1)
  #end
  
describe "testing admin webpage" do
  before(:each) do
    http_login_password
    @post_webdev = Post.create(:title => "Web application online!")
    @post_ins = PostMotivation.create()
    @project = Projectsabout.create()
    @mystory = Mystory.create(name: "My story:",body: "My name is Matthew...")
    @contact_info = Contactinfo.create(:name_surname => "Matthew Kilan",:facebook => "https://www.facebook.com/mateusz.kilan",:twitter => "https://twitter.com/MateuszKilan1",:email_address => "matthew.kilan@gmail.com",:phone_number => "790-680-882",:github => "https://github.com/BobcatMK")
  end
  
  it "should have proper content" do
    visit "/admin"
    expect(page).to(have_content(@contact_info.facebook))
  end
end
