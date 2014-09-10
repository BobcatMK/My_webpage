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
    page.driver.browser.authorize ENV['ADMIN_LOGIN'], ENV['ADMIN_PASSWORD']
    @post_webdev = Post.create(:title => "Web application online!",:body => "This is test content and nothing more",:short => "This is short content",:date => "25.07.2014")
    @webdev_comment = Main.create(:name => "Grzegorz Jakistam",:content => "This is some content",:post_id => 1,:post_motivation_id => 0)
    @post_ins = PostMotivation.create(:title => "Web application online!",:body => "This is test content and nothing more",:short => "This is short content",:date => "25.07.2014")
    @ins_comment = Main.create(:name => "Grzegorz Jakistam",:content => "This is some content",:post_id => 0,:post_motivation_id => 1)
    @product = Product.create(:name => "Ruby on Rails",:short_description => "This is short description",:affiliate_link => "--> READ MORE <--",:picture1 => "hartl.png",:author => "Michael Hartl",:price => 50,:name_affiliate_link => "http://zfer.us/bp1hf")
    @project = Projectsabout.create(:name => "Matthew Kilan",:description => "This is just description",:picture1 => "pic1.jpg",:picture2 => "pic2.jpg",:picture3 => "pic5.jpg",:link => "http://www.matthew-kilan.com",:picture4 => "pic4.jpg")
    @mystory = Mystory.create(name: "My story:",body: "My name is Matthew...")
    @contact_info = Contactinfo.create(:name_surname => "Matthew Kilan",:facebook => "https://www.facebook.com/mateusz.kilan",:twitter => "https://twitter.com/MateuszKilan1",:email_address => "matthew.kilan@gmail.com",:phone_number => "790-680-882",:github => "https://github.com/BobcatMK")
  end
  
  it "should have proper content" do
    visit "/admin"
    expect(page).to(have_content("Web development, list of all posts"))
    expect(page).to(have_selector("a[href='/create_post']"))
    expect(page).to(have_selector("a[href='/create_motivation']"))
    expect(page).to(have_link("Link to all comments in Web development and Motivation category"))
    
    
    
    # Checking webpage for @contact_info content
    expect(page).to(have_content(@contact_info.name_surname))
    expect(page).to(have_content(@contact_info.facebook))
    expect(page).to(have_content(@contact_info.twitter))
    expect(page).to(have_content(@contact_info.email_address))
    expect(page).to(have_content(@contact_info.github))
    expect(page).to(have_content(@contact_info.phone_number))
    # end
  end
  
end
